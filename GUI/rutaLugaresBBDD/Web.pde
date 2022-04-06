import java.awt.Desktop;
import java.net.URI;
import java.io.IOException;
import java.net.URISyntaxException;

Desktop desktop;

void openWebPage(String siteUrl) {
  try {
    URI site = new URI(siteUrl);
    if (Desktop.isDesktopSupported() && desktop.isSupported(Desktop.Action.BROWSE)) {
      desktop.browse(site);
    } else {
      println("App no suporta el navegador");
    }
  } catch(URISyntaxException e) {
    e.printStackTrace();
  } catch(IOException e) {
    e.printStackTrace();
  }
}
