package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.ImmagineProdottoBean;
import model.ImmagineProdottoDAO;
import model.ProdottoBean;
import model.ProdottoDAO;
import model.UserBean; 

@WebServlet("/InvalidaProdotto")
public class InvalidaProdottoServlet extends HttpServlet{

    private static final long serialVersionUID = 7631554330668275487L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        // Recupero dell'utente dalla sessione
        UserBean user = (UserBean) request.getSession().getAttribute("utente");
        
        // Verifica se l'utente � un amministratore
        if (user == null || !user.getTipoUtente().equals("ADMIN")) {
            response.getWriter().println("Access Denied: You do not have permission to perform this action.");
            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("specificaProdotto.jsp");
        
        ProdottoDAO Prodotti = new ProdottoDAO((DataSource) getServletContext().getAttribute("DataSource"));
        ImmagineProdottoDAO Immagini = new ImmagineProdottoDAO((DataSource) getServletContext().getAttribute("DataSource"));
        
        try {
            int idProdotto = Integer.parseInt(request.getParameter("id"));
            int valido = Integer.parseInt(request.getParameter("valido"));
            int inEvidenza = Integer.parseInt(request.getParameter("evidenza"));
            ProdottoBean prodotto = Prodotti.doRetrieveByKey(idProdotto);
            prodotto.setValidoProdotto(valido);
            prodotto.setInEvidenza(inEvidenza);
            Prodotti.doSave(prodotto);
            request.getSession().setAttribute("ProdottoRichiesto", prodotto);
            List<ImmagineProdottoBean> ImmaginiProdotto = (List<ImmagineProdottoBean>) Immagini.doRetrieveByProductKey(idProdotto);
            request.getSession().setAttribute("ProdottoRichiestoImmagini", ImmaginiProdotto);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doGet(request, response);
    }
}