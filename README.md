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
