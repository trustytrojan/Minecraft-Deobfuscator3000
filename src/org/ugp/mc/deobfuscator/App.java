/*
 * Decompiled with CFR 0.152.
 */
package org.ugp.mc.deobfuscator;

import java.io.IOException;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class App
extends Application {
    public void start(Stage primaryStage) throws IOException {
        FXMLLoader loader = new FXMLLoader(((Object)((Object)this)).getClass().getResource("assets/layout.fxml"));
        Scene scene = new Scene((Parent)loader.load());
        Platform.runLater(() -> {
            try {
                ((Deobfuscator3000)loader.getController()).initialize(this, primaryStage);
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        });
        primaryStage.setOnCloseRequest(ev -> {
            Platform.exit();
            System.exit(0);
        });
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}
