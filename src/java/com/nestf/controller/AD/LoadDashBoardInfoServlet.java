/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nestf.controller.AD;

import com.nestf.bill.BillDAO;
import com.nestf.util.MyAppConstant;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoadDashBoardInfoServlet", urlPatterns = {"/LoadDashBoardInfoServlet"})
public class LoadDashBoardInfoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ServletContext context = request.getServletContext();
        Properties siteMap = (Properties) context.getAttribute("SITEMAP");
        String url = (String) siteMap.get(MyAppConstant.AdminFeatures.DASHBORAD_PAGE);
        try {
            /* TODO output your page here. You may use following sample code. */   
            BillDAO billDAO = new BillDAO();
            double revenueToday = billDAO.getTodayRevenue();
            double revenueThisYear = billDAO.getThisYearRevenue();
            int todayBills = billDAO.getTodayNumOfBills();
            int pendingBillsCount = billDAO.getNumOfPendingBills();
            int pendingBillsToday = billDAO.getTodayNumOfPendingBills();
            request.setAttribute("TODAY_REVENUE", revenueToday);
            request.setAttribute("YEAR_REVENUE", revenueThisYear);
            request.setAttribute("TODAY_BILLS", todayBills);
            request.setAttribute("PENDING_BILLS", pendingBillsCount);
            request.setAttribute("TODAY_PENDING", pendingBillsToday);           
        } catch (SQLException ex) {
            Logger.getLogger(LoadDashBoardInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
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
