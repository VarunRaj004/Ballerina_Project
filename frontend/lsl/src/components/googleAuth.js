


export const GoogleAuth = () => {
    return(

        <GoogleOAuthProvider clientId ="" >
            <GoogleLogin
                onSuccess = {
                    credentialResponse => {
                        const token = credentialResponse.credential;;
                    }
                }
            </GoogleOAuthProvider>
    );
}