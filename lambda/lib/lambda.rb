require "aws-sdk-lambda"

class LambdaFunction

  attr_accessor :name, :aws_lambda_client, :role, :environment

  def initialize name
    @name = name
    @role = ENV["AWS_LAMBDA_EXECUTION_ROLE"]
    @environment = {}
    initialize_aws_lambda_client
  end

  def create **kwargs
    aws_lambda_client.create_function({ 
      role: role, 
      function_name: name,
      environment: environment
    }.update(kwargs))
  end

  def find
    aws_lambda_client.get_function({ function_name: name })
  rescue Aws::Lambda::Errors::ResourceNotFoundException
    nil
  end

  def invoke **kwargs
    options = {
      function_name: name
    }.update(kwargs)

    aws_lambda_client.invoke(**options)
  end

  def update_code **kwargs
    code = kwargs[:with]
    aws_lambda_client.update_function_code({
      function_name: name,
      zip_file: code
    })
  end

  def update_configuration **kwargs
    aws_lambda_client.update_function_configuration({
      function_name: name,
      environment: environment
    }.update(kwargs))
  end

  private

  def initialize_aws_lambda_client
    @aws_lambda_client = Aws::Lambda::Client.new({
      secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      region:            ENV["AWS_REGION"]
    })
  end
end