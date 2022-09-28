/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nestf.controller;

import com.nestf.customer.CustomerDAO;
import com.nestf.customer.CustomerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateCustomerName", urlPatterns = {"/UpdateCustomerName"})
public class UpdateCustomerName extends HttpServlet {

    private static final String ERROR = "account.jsp";
    private static final String SUCCESS = "account.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        CustomerDTO customerLog = (CustomerDTO) session.getAttribute("CUSTOMER");
        try {
            int customerPhone = Integer.parseInt(request.getParameter("customerPhone"));
            String newCustomerName = request.getParameter("newCustomerName");
            String customerAddress = request.getParameter("customerAddress");
            String password = request.getParameter("password");
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
            int point = Integer.parseInt(request.getParameter("point"));
            boolean check = false;
            if (newCustomerName == null) {
                check = false;
            }
            CustomerDTO customer = new CustomerDTO(customerPhone, password, newCustomerName, customerAddress, gender, point);
            CustomerDAO dao = new CustomerDAO();
            check = dao.updateCusName(customer);
            if (check) {
                url = SUCCESS;
                customerLog.setCustomerName(newCustomerName);
            }
        } catch (Exception e) {
            log("Error at UpdateCustomerName: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
