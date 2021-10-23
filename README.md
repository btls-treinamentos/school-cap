# school-cap
I make this project to pratice and study more about SAP Cloud Application Programming Model. More infos in this link
http://www.saphanadev.com.br/2020/02/27/sap-cloud-application-programming-model-projeto-exemplo/

## Get Started

This project is a example application to explorer CAP - SAP Cloud Application Programming Model capabilities. Documentation in [SAP Cloud Application Programming Model web site](https://cap.cloud.sap)


### Development Environment

I am using Visual Studio Code as local development environment. To get the language support for the CDS objects you must manually install the corresponding extension for Visual Studio Code. To install this extension, proceed as follows

### CDS Language Support for Visual Studio Code

The Visual Studio Code extension features language support for the Core Data Services (CDS) language as used in the SAP Cloud Application Programming Model.

The extension is now available on Visual Studio Marketplace. To install it, proceed as follows:

1. Go to Visual Studio Marketplace.
2. Choose Install and VS Code opens the details page for the extension.
3. In VS Code choose Install to enable the extension.

![image](https://user-images.githubusercontent.com/91032133/138568244-42539a9c-817c-4021-9095-2fa94e1c2353.png)

### Nodejs and SQLite for Local Development

Install Node.js → 14.18.1 LTS

Install SQLite (only required on Windows).

### CDS Command Line Tools

Install the cds-dk command line tools

Originally the Node.js package incarnation of CAP was in the form of a single top-level module @sap/cds. Today we also have @sap/cds-dk, where the “dk” refers to “development kit”. This is the package that you’ll want to install to develop with CAP, taking advantage of all the tools that it includes; in parallel there is @sap/cds which you can think of as the leaner “runtime” package

```sh
npm i -g @sap/cds-dk
```

### Build the Project

To build the project, walk through the following steps

1. Download or clone the repository.
2. Navigate to the folder of your local repository
3. Execute the command `npm install`to install the relevant NPM packages
4. Execute the command `npm run build` to trigger a clean build of the project
5. Execute the command `npm run deploy` to deploy in the local sqlite database
6. Execute the command `cds watch`  to test and modify files and automaticaly restart the server locally 

or

6. Execute the command `npm start` to startup the project locally
  

You can now access the services via

```sh
 http://localhost:4004
```

### Initialize the Local Database

Run the following command to Initialize your local SQLite DB:

```sh
cds deploy --to sqlite:db/schoolcap.db
```
Do not forget to repeat this step to initialize the local database whenever you changed the datamodel


### How to Test

To test the services to read data you can only execute and access the url. Admin services in the local enviroment uses the user "admin" without inform password.
The Student services, inform the user "student", without password.

To test the creation services (Create Student and Enrollment), use the postman collection file: test\school.postman_collection.json. [Install Postman](https://www.postman.com/downloads/) and import this file. To create a new student use create_student. To Enroll this student in a class use enroll_student.


## Deploy to SAP Cloud Platform (Trial)

#### Prerequisites

1. If you don’t have a Cloud Foundry Subaccount on SAP Cloud Platform yet, [create your Trial Account:](https://account.hanatrial.ondemand.com/)
2. [The Cloud MTA Build Tool (MBT) is installed](https://sap.github.io/cloud-mta-build-tool/)
3. [Download and install the cf command-line client for Cloud Foundry.](https://github.com/cloudfoundry/cli#downloads)
4. [Install MultiApps CF CLI Plugin](https://github.com/cloudfoundry-incubator/multiapps-cli-plugin)
5. Log on to Cloud Foundry, using cf login to your trial account]

```sh
cf login  # this will ask you to select CF API, org, and space
```

#### Build

To Build mta file in folder mta_arquives

```sh 
NODE_ENV=production npm run build:cf
```

If you're running Windows then you'll need to set the environment variable first with set and then run the command, like this:

```sh 
set NODE_ENV=production
npm run build:cf
```

#### Deploy

To deploy de mta file to cloud foundry

```sh
npm run deploy:cf
```

After deploy you can view the url for the service  and App Rounter on console, the url changes according you account and enviroment.

```sh
Application "school-app-router" started and available at "...school-app-router...."
Application "school-srv" started and available at "...school-srv...."
```

To check the apps and services use the following commands:

```sh
cf apps
cf services
```

#### How to execute on SAP Cloud

To test the application on SAP Cloud Platform you will need to configure the roles on SAP Cloud Enviroment. To do this logon in your trial account Cloud Foundry enviroment.

Create the Role Collections on Cloud Foundry Enviroment

1. Access the Subaccount on Cloud Foundry Enviroment. In the left menu click on Role Collections, in security menu;
2. Create a New Role Collection. Ex. SCHOOL_AUTH

Assign Role Collection to a user;

3. Continuing on Subaccount area, click on Trust Configurarion in security menu;
4. Clicque on SAP ID Service link
5. Inform in E-mail Address the email that you uses to logon on SAP Cloud Platform, then click on Show Assignments;
6. After click on Assign Role Collection, then select the Role Collection Created before. 


Assign the Role Collection to Application Role

1. Enter in the the DEV space where application is hosted.
1. Access the Applications, on left side menu, then open school-app-router application.
2. On left side menu, choose Roles.
3. Next screen, click on plus icon on Actions. Then add the Role Collection created in previous step.

### Trobleshooting

Error using MTA Build Tool on windows, https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows

### References

https://github.com/SAP-samples/cloud-cap-nodejs-codejam/tree/master/exercises
https://cap.cloud.sap/docs/
