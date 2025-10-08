import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class SpaRedirectFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String path = request.getRequestURI();
        if (!path.startsWith("/myapp/assets")
            && !path.endsWith(".js")
            && !path.endsWith(".css")
            && !path.endsWith(".png")
            && !path.endsWith(".ico")
            && !path.endsWith(".json")
            && !path.endsWith(".map")
            && !path.endsWith(".svg")
        ) {
            request.getRequestDispatcher("/index.html").forward(request, response);
            return;
        }
        chain.doFilter(req, res);
    }
}
// This filter redirects all requests that are not for static assets to index.html
// This is necessary for single page applications (SPA) that use client-side routing