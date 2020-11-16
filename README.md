# shastic_challenge

## Run project with docker-compose
```sh
docker-compose build
docker-compose up -d    
docker-compose exec shastic_challenge bundle exec ruby -r './app.rb' -e 'call'
```

## Run tests with rspec
Notice: Add APP_ENV=test is neccesary in order to run tests over test's database
```sh
docker-compose exec -e APP_ENV=test shastic_challenge bundle exec rspec
```

## Deploy to AWS Lambda
At root path of this project exec build.sh script
```sh
./build.sh
```


Enter to lambda dir and set .env file 
```sh
# lambda/.env
APP_ENV="production"
DB_HOST="your-host"
DB_USER="your-user"
DB_PASS="your-pass"
API_VISITS_URL="http://minimal-api-here/response.json"
AWS_SECRET_ACCESS_KEY="secret-access-key"
AWS_ACCESS_KEY_ID="access-key-id"
AWS_REGION="aws-region"
AWS_LAMBDA_EXECUTION_ROLE="arn-aws-iam-role"
AWS_LAMBDA_SUBNET_ID="subnet-id"
AWS_LAMBDA_SG_ID="sg-id"
```

Run bundle install
```sh
bundle
```

And then exec rake tasks

Notice: This rake configs a VPC for Lambda function and could take around 5 minutes to be ready to invoke
```sh
bundle exec rake lambda:deploy
bundle exec rake lambda:invoke
```