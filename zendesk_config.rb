def zendesk_config(config)
    # Mandatory:
    config.url = "https://example.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

    config.username = "user@example.com"

    # Choose one of the following depending on your authentication choice
    # config.token = "your zendesk token"
    config.password = "password123"

    # Optional:
    
    # Retry uses middleware to notify the user
    # when hitting the rate limit, sleep automatically,
    # then retry the request.
    config.retry = true

    # Logger prints to STDERR by default, to e.g. print to stdout:
    require 'logger'
    config.logger = Logger.new(STDOUT)

    # Changes Faraday adapter
    # config.adapter = :patron

    # Merged with the default client options hash
    # config.client_options = { :ssl => false }

    # When getting the error 'hostname does not match the server certificate'
    # use the API at https://yoursubdomain.zendesk.com/api/v2

    return config
    
end