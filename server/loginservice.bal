import ballerina/http;
import ballerina/log;

service /api/login on new http:Listener(8080) {
    resource function post login(http:Caller caller , http:Request req) returns error?{
        json|error payLoad = req.getJsonPayload();
        if(payLoad is json){
             string|error email = payLoad.email.ensureType(string);
             string|error password = payLoad.password.ensureType(string);
             log:printInfo("Received Credentials: ");
             json res = {message: "Login Succesful"};
             check caller-> respond(res);
        }
    }
}