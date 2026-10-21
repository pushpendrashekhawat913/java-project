package com.shopsphere;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns={"/products"})
public class ProductsServlet extends HttpServlet {
    private final ProductDAO productDAO = new ProductDAO();
    @Override protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            request.setAttribute("products", productDAO.findActive(request.getParameter("q")));
            request.setAttribute("query", request.getParameter("q") == null ? "" : request.getParameter("q"));
            request.getRequestDispatcher("/WEB-INF/views/products.jsp").forward(request,response);
        } catch (SQLException e) {
            getServletContext().log("Unable to load products",e);
            response.sendError(500,"Unable to load products. Check database settings.");
        }
    }
}
