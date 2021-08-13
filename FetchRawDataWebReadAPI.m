function [HttpStatsuCode,JsonReponse] =FetchRawDataWebReadAPI(UserInputDomain)

MatlabHttpStatus=[100 101 102 103 200  201 202 204 205 206 207 208 226 414 300 301 302 303 304 305 306 307 308 429 400 401 402 403 404 405 406 408 409 410 411 412 413 415 416 417 421 422 423 424 426 428 431 203 407 507 500 501 502  503 504 505 506 508 509 510 511 451];
MatlabHttppStrStatusCode= ["Continue" "SwitchingProtocols" "Processing" "EarlyHints" "OK" "Created" "Accepted" "NoContent" "ResetContent" "PartialContent" "MultiStatus" "AlreadyReported" "IMUsed" "URITooLong" "MultipleChoices" "MovedPermanently" "Found" "SeeOther" "NotModified" "UseProxy" "SwitchProxy" "TemporaryRedirect" "PermanentRedirect" "TooManyRequests" "BadRequest" "Unauthorized" "PaymentRequired" "Forbidden" "NotFound" "MethodNotAllowed" "NotAcceptable" "RequestTimeout" "Conflict" "Gone" "LengthRequired" "PreconditionFailed" "PayloadTooLarge" "UnsupportedMediaType" "RangeNotSatisfiable" "ExpectationFailed" "MisdirectedRequest" "UnprocessableEntity" "Locked" "FailedDependency" "UpgradeRequired" "PreconditionRequired" "RequestHeaderFieldsTooLarge" "NonAuthoritativeInformation" "ProxyAuthenticationRequired" "InsufficientStorage" "InternalServerError" "NotImplemented" "BadGateway" "ServiceUnavailable" "GatewayTimeout" "HTTPVersionNotSupported" "VariantAlsoNegotiates" "LoopDetected" "Unassigned" "NotExtended" "HTTPVersionNotSupported" "UnavailableForLegalReasons"];

request = matlab.net.http.RequestMessage();
request.Method = 'GET';
request.Header = [matlab.net.http.field.ContentTypeField( 'application/json' ),matlab.net.http.field.AcceptField( 'application/json' ) ];
options = weboptions('HeaderFields',{'Content-Type' 'application/json'}  );
try
    data= webread(UserInputDomain,options);
    if(length(data)==0)
        JsonReponse="error";
        HttpStatsuCode = 400

    else
        JsonReponse=data;
        HttpStatsuCode = 200;
    end
catch e
    disp('The requested page does not exist! Gracefully exiting...')
    fprintf(1,'The identifier was:\n%s',e.identifier);
    fprintf(1,'There was an error! The message was:\n%s',e.message);
    JsonReponse=e.message;
    HttpStatsuCode = 400
end

end
