class Uri < ActiveRecord::Base
  belongs_to :version
  attr_accessible :file_name, :file_uid, :file, :make_link
  file_accessor :file do
    storage_path{|f| "#{file_storage_path}/#{f.name}"}
  end
  def file_storage_path
    "#{version.library.name}/#{version.version}"
  end
  after_create :unpack
  def unpack
    if self.file_name.downcase.match(/\.zip$/)
      #source = File.join("#{Rails.root}/public/system/dragonfly/#{Rails.env}",file_uid)
      zipfile = Zip::ZipFile.open(file.path)
      zipfile.each do |entry|
        if entry.file? && ! File.basename(entry.name).match(/^\./)
          if entry.name.downcase.match(/\.(gif|jpeg|jpg|png|js|css)$/)
            extracted_file = zipfile.read(entry.name)
            new_uri = self.version.uris.build
            new_uri.file = extracted_file
            new_uri.file_name = File.basename(entry.name)
            new_uri.save!
          end
        end
      end
      self.destroy
    end
  end
end
