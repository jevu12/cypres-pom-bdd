FROM cypress/base:16

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN npm install

RUN npm install --save-dev  \
    @badeball/cypress-cucumber-preprocessor  \
    @bahmutov/cypress-esbuild-preprocessor  \
    @cypress/webpack-preprocessor \
    @shelex/cypress-allure-plugin

RUN npx cypress install
RUN $(npm bin)/cypress verify

CMD ["npm", "run", "allure:report"]



