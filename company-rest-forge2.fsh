
project-new --named company-rest-java --finalName company --topLevelPackage org.terra.company


jpa-new-entity --named Employee
jpa-new-field --named firstName --length 15 --columnName first_name --not-nullable ;
jpa-new-field --named lastName --length 15 --columnName last_name --not-nullable ;

constraint-add --onProperty firstName --constraint NotNull;
constraint-add --onProperty firstName --constraint Size --min 1 --max 15;
constraint-add --onProperty lastName --constraint NotNull;
constraint-add --onProperty lastName --constraint Size --min 1 --max 15;


jpa-new-entity --named Company
jpa-new-field --named name --length 200 --not-nullable ;
jpa-new-field --named address --length 150 --not-nullable ;
jpa-new-field --named city --length 20 --not-nullable ;
jpa-new-field --named country --length 20 --not-nullable ;
jpa-new-field --named email --length 20;
jpa-new-field --named telephone --length 20;

constraint-add --onProperty name --constraint NotNull;
constraint-add --onProperty name --constraint Size --min 1 --max 200;
constraint-add --onProperty address --constraint NotNull;
constraint-add --onProperty address --constraint Size --min 1 --max 150;
constraint-add --onProperty city --constraint NotNull;
constraint-add --onProperty city --constraint Size --min 1 --max 20;
constraint-add --onProperty country --constraint NotNull;
constraint-add --onProperty country --constraint Size --min 1 --max 20;
constraint-add --onProperty email --constraint Size --max 20;
constraint-add --onProperty telephone --constraint Size --max 20;

jpa-new-field --named employee --type org.terra.company.model.Employee --relationshipType One-to-Many

# one-off
# addon-install-from-git --url https://github.com/forge/angularjs-addon.git

scaffold-generate --provider AngularJS --targets org.terra.company.model.Company org.terra.company.model.Employee --generateRestResources

# sed -i 's/  <\/properties>/    <wildfly.username>admin<\/wildfly.username>\n    <wildfly.password>1admin!<\/wildfly.password>\n&/' pom.xml

# sed -i 's/  <\/plugins>/    <plugin>\n    <groupId>org.wildfly.plugins<\/groupId>\n   <artifactId>wildfly-maven-plugin<\/artifactId>\n   <version>1.1.0.Alpha5<\/version>\n    <configuration>\n    <port>9990<\/port>\n    <\/configuration>\n    <\/plugin>\n&/' pom.xml
