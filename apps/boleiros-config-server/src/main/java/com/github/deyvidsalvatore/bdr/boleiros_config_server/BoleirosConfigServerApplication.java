package com.github.deyvidsalvatore.bdr.boleiros_config_server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class BoleirosConfigServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(BoleirosConfigServerApplication.class, args);
	}

}
