package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.PrettyXmlSerializer;
import org.htmlcleaner.TagNode;
import org.htmlcleaner.XmlSerializer;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.itextpdf.text.DocumentException;

public class PDF {

	public static void main(String[] args) throws com.lowagie.text.DocumentException, DocumentException {
		String inputFile = "C:\\Users\\Matteo\\git\\repository\\Prova\\src\\template\\document\\Progetto\\progetto.html";
		String outputFile = "C:/Users/Matteo/Desktop/TestPdfWithoutCSS.pdf";

		// PDF
		try {

			String url = new File(inputFile).toURI().toURL().toString();
			System.out.println("URL: " + url);

			OutputStream out = new FileOutputStream(outputFile);

			// Flying Saucer part
			ITextRenderer renderer = new ITextRenderer();

			renderer.setDocument(url);
			renderer.layout();
			renderer.createPDF(out);

			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
