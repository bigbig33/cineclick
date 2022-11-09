package email;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import DTO.SessaoDTO;

public class EnviarEmail {
	private static final String meuEmail = "cineclick.projeto@hotmail.com";
	private static final String minhaSenha = "cineclick123";
	
	private String emailDestinatario;
	private String assunto;
	private String msg;
	
	public String getEmailDestinatario() {
		return emailDestinatario;
	}
	public void setEmailDestinatario(String emailDestinatario) {
		this.emailDestinatario = emailDestinatario;
	}
	public String getAssunto() {
		return assunto;
	}
	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public boolean enviarGmail() {

		boolean retorno = false;
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        
        Session s = Session.getDefaultInstance(props,
        		new javax.mail.Authenticator() {
        			protected PasswordAuthentication getPasswordAuthentication() {
        				return new PasswordAuthentication(meuEmail, minhaSenha);
        			}
        		});
        
        try {
            MimeMessage message = new MimeMessage(s);
            message.setFrom(new InternetAddress(meuEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.emailDestinatario));

            message.setSubject(this.assunto);
            message.setContent(this.msg, "text/html; charset=utf-8");

            //send message  
            Transport.send(message);

            retorno = true;

        } catch (MessagingException e) {
            retorno = false;
            e.printStackTrace();
        }
        return retorno;
	}
	
	public boolean enviarHotmail()
    {
        boolean retorno = false; 
        Properties props = new Properties();
        /** Parâmetros de conexão com servidor Hotmail */
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.host", "smtp.office365.com");
        props.put("mail.smtp.socketFactory.port", "587");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");

        Session session = Session.getDefaultInstance(props,
                    new javax.mail.Authenticator() {
                         protected PasswordAuthentication getPasswordAuthentication()
                         {
                               return new PasswordAuthentication(meuEmail, minhaSenha);
                         }
                    });

        /** Ativa Debug para sessão */
        session.setDebug(true);

        try {

              Message message = new MimeMessage(session);
              message.setFrom(new InternetAddress(meuEmail)); //Remetente

              message.setRecipients(Message.RecipientType.TO,
                                InternetAddress.parse(emailDestinatario)); //Destinatário(s)
              message.setSubject(assunto);//Assunto
              message.setContent(msg, "text/html; charset=utf-8");
              /**Método para enviar a mensagem criada*/
              Transport.send(message);

              System.out.println("Feito!!!");
              retorno = true;
         } catch (MessagingException e) {
              throw new RuntimeException(e);
        }
            
            return retorno;
    
    }
	
	public StringBuffer montarEmail(SessaoDTO sessao) {
		
		StringBuffer texto = new StringBuffer();
		texto.append("<h2 align='center'>Ingressos</h2>");
		texto.append("<style type=\"text/css\">\r\n"
				+ ".tg  {border-collapse:collapse;border-color:#ccc;border-spacing:0;}\r\n"
				+ ".tg td{background-color:#fff;border-color:#ccc;border-style:solid;border-width:1px;color:#333;\r\n"
				+ "  font-family:Arial, sans-serif;font-size:14px;overflow:hidden;padding:10px 5px;word-break:normal;}\r\n"
				+ ".tg th{background-color:#f0f0f0;border-color:#ccc;border-style:solid;border-width:1px;color:#333;\r\n"
				+ "  font-family:Arial, sans-serif;font-size:14px;font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}\r\n"
				+ ".tg .tg-0w8i{font-size:100%;text-align:left;vertical-align:top}\r\n"
				+ ".tg .tg-peb5{font-size:large;text-align:left;vertical-align:top}\r\n"
				+ "</style>");
		texto.append("<table>");
		texto.append("<thead>");
		texto.append("<tr><th>Nome Filme</th><th>Data</th><th>Hora</th><th>Tipo Ingresso</th><th>Quantidade</th><th>Preço</th><th>Tipo Pagamento</th></tr>");
		texto.append("</thead>");
		texto.append("<tbody>");
		texto.append("<tr>");
		texto.append("<td>");
		texto.append(sessao.getNomeFilme());
		texto.append("</td>");
		texto.append("<td>");
		texto.append(sessao.getDataFilme());
		texto.append("</td>");
		texto.append("<td>");
		texto.append(sessao.getHoraFilme());
		texto.append("</td>");
		texto.append("<td>");
		texto.append(sessao.getTipoIngresso());
		texto.append("</td>");
		texto.append("<td>");
		texto.append(sessao.getQuantidade());
		texto.append("</td>");
		texto.append("<td>");
		texto.append(sessao.getPreco());
		texto.append("</td>");
		texto.append("<td>");
		texto.append(sessao.getTipoPagamento());
		texto.append("</td>");
		texto.append("</tr>");
		texto.append("</tbody>");
		texto.append("</table>");
		texto.append("<br>");
		texto.append("<img src=\"https://br.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/core_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png\" width=\"120\" height=\"120\">");
		
		return texto;
	}
}
