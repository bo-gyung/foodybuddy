package com.foodybuddy.foody.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.foodybuddy.foody.service.FoodyService;
import com.foodybuddy.foody.vo.Foody;
import com.foodybuddy.foodyPic.vo.Foody_Pic;

@WebServlet("/foody/update")
public class FoodyUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FoodyUpdateServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int foody_no = Integer.parseInt(request.getParameter("foody_no"));
        
        FoodyService foodyService = new FoodyService();
        Foody foody = foodyService.viewFoody(foody_no).get(0);
        List<Foody_Pic> picFiles = foodyService.pick_Pic(foody_no);
        
        request.setAttribute("foody", foody);
        request.setAttribute("picFiles", picFiles);

        RequestDispatcher rd = request.getRequestDispatcher("/views/foody/update.jsp");
        rd.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


}
