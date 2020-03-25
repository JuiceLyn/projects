package client;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

public class AppliClient {
	
	public static void main(String[] args) throws UnknownHostException, IOException {
		String choixService;
		System.out.println("Veuillez selectionner un service (emprunter/reserver/retourner) : ");
		
		Scanner sc = new Scanner(System.in);
		choixService = sc.nextLine();
		
		switch (choixService) {
			case ("reserver"): {
				Socket s = new Socket("localhost", 2500);
				break;
			}
			case ("emprunter"): {
				Socket s = new Socket("localhost", 2600);
				break;
			}
			case ("retourner"): {
				Socket s = new Socket("localhost", 2700);
				break;
			}
			
		}	
		
	}
	
}
	