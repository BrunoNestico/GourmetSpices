package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.CarrelloBean;
import model.CarrelloDAO;
import model.ContenenteBean;
import model.ContenenteCarrelloBean;
import model.ContenenteCarrelloCombinedKey;
import model.ContenenteCarrelloDAO;
import model.ContenenteCombinedKey;
import model.ContenenteDAO;
import model.ImmagineProdottoBean;
import model.ImmagineProdottoDAO;
import model.OrdineBean;
import model.OrdineDAO;
import model.ProdottoBean;
import model.ProdottoDAO;
import model.UserBean;
import model.UserDAO;

@WebServlet("/carrello")
public class CarrelloServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -676741214133898517L;
	
	
	public CarrelloServlet() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		UserBean utente = (UserBean) request.getSession().getAttribute("utente");
		
		RequestDispatcher dispatcherToCart = request.getRequestDispatcher("cart.jsp");
		if(utente==null) {
			dispatcherToCart.forward(request, response);
			return;
		}
			
		String email = utente.getEmail();
			
		
		List<String> errors = new ArrayList<>();
		
		

		
		if(email == null || email.trim().isEmpty()) {
			errors.add("Il campo username non pu� essere vuoto!");
		}
		
        if (!errors.isEmpty()) {
        	request.setAttribute("errors", errors);
        	dispatcherToCart.forward(request, response);
        	return;
        }
        
        email = email.trim();
        
        
		
		try {
			CarrelloDAO Carrello = new CarrelloDAO((DataSource)getServletContext().getAttribute("DataSource"));
	        CarrelloBean CarrelloBean = Carrello.doRetrieveByUserKey(email);
	        if(CarrelloBean == null) {
	        	System.out.println("merda");
	        }
	        //System.out.println("email"+CarrelloBean.getEmail());
			int idCarrello = CarrelloBean.getIdCarrello();
			//System.out.println(idCarrello);
			
			
			
			ContenenteCarrelloDAO Contenente = new ContenenteCarrelloDAO((DataSource)getServletContext().getAttribute("DataSource"));
			ProdottoDAO Prodotti = new ProdottoDAO((DataSource)getServletContext().getAttribute("DataSource"));
			ImmagineProdottoDAO ImmaginiProdotti = new ImmagineProdottoDAO((DataSource)getServletContext().getAttribute("DataSource"));
			
			request.getSession().setAttribute("idCarrello", idCarrello);
		
			List<ContenenteCarrelloBean> ContenenteCarrelloBeanList = (List<ContenenteCarrelloBean>) Contenente.doRetrieveByCarrelloKey(idCarrello);
			request.getSession().setAttribute("ContenenteCarrelloBeanList"+Integer.toString(idCarrello), ContenenteCarrelloBeanList);
			for(ContenenteCarrelloBean ContenenteCarrello :ContenenteCarrelloBeanList) {
				//int quantit� = ContenenteCarrello.getQuantita();
				int idProdotto = ContenenteCarrello.getIdProdotto();
				ProdottoBean Prodotto = Prodotti.doRetrieveByKey(idProdotto);
				//request.getSession().setAttribute(Integer.toString(idCarrello)+Integer.toString(ContenenteCarrello.getIdProdotto()),quantit�);
				request.getSession().setAttribute("ProdottoCarrello"+Integer.toString(idProdotto), Prodotto);
				ProdottoBean product = (ProdottoBean) request.getSession().getAttribute("ProdottoCarrello"+idProdotto);
				List<ImmagineProdottoBean> Immagini = (List<ImmagineProdottoBean>)ImmaginiProdotti.doRetrieveByProductKey(idProdotto);
				request.getSession().setAttribute("Prodottoimmagini"+Integer.toString(idProdotto), Immagini);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		
		
		dispatcherToCart.forward(request, response);
		
		
	}
		
		
		

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doGet(request, response);
	}
}
	