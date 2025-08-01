import ballerina/http;

listener http:Listener server = new(8080);
http:Client authClient = check new("http://localhost:8081");

serive on / server{

    resource funsction options [.](http:Caller caller , http:Request req)returns error?{
        http:Response res = new;
        res.setHeader("Access-Control-Allow-Origin","http://localhost:3000");
    }
}