package kr.co.wisenut.config;

@Configuration
public class ErrorConfig implements ErrorPageRegistrar {

    @Override
    public void registerErrorPages(ErrorPageRegistry registry){
        registry.addErrorPages(new ErrorPage(HttpStatus.BAD_REQUEST, "/err/400"));
        registry.addErrorPages(new ErrorPage(HttpStatus.UNAUTHORIZED, "/err/401"));
        registry.addErrorPages(new ErrorPage(HttpStatus.FORBIDDEN, "/err/403"));
        registry.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/err/404"));
        registry.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR , "/err/500"));
        registry.addErrorPages(new ErrorPage("/err/default"));
    }
}