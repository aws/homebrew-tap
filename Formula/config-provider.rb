require 'json'

class ConfigProvider
    def initialize(config_file_path='../bottle-config.json')
        file = File.read(config_file_path)
        @config_data = JSON.parse(file)
    end

    def url
        @config_data['url']
    end

    def sha256
        @config_data['sha256']
    end

    def root_url
        @config_data['bottle']['root_url']
    end

    def sierra_hash
        @config_data['bottle']['sha256']['sierra']
    end

    def linux_hash
        @config_data['bottle']['sha256']['linux']
    end
end