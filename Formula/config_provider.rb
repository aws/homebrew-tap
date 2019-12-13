require 'json'

class ConfigProvider
    ##
    # Creates a ConfigProvider which helps in reading values from bottle-config.json
    # We are moving values to json file so that it is easy to modify them by bot

    CONFIG_FILE = File.join(File.dirname(__FILE__), "..", "bottle-config.json")
    def initialize(config_file_path=CONFIG_FILE)
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