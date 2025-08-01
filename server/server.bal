import ballerina/http;

listener http:Listener server = new(8080);
http:Client authClient = check new("http://localhost:8081");

serive on / server{

    resource funsction options [.](http:Caller caller , http:Request req)returns error?{
        http:Response res = new;
        res.setHeader("Access-Control-Allow-Origin","http://localhost:3000");
        res.setHeader("Access-Control-AllowMethods","GET POST OPTIONS");
        res.setHeader("Access-Control-AllowHeaders","Content-Type Authorization");
        res.statusCode = 200;
        check caller->respond(res)
    }

    resource function post auth(http:Caller caller , http:Request req)returns error? {
        http:Response | error backendRes = authClient->post("/auth",req);
        if backendRes is http:Response {
            backendRes.setHeader("Access-Control-Allow-Origin","http://localhost:3000");
            check caller->respond(backendRes);
        }else{
            check caller->respond({error:"Failed AUth Service"});
        }
    }


}