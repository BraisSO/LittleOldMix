package compresorPDF;

import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class CompresorPDF extends JFrame {

	String nombre;

	public CompresorPDF() {
		Container ventana = getContentPane();
		ventana.setLayout(new GridBagLayout());

		// Boton AÑADIR
		GridBagConstraints constraintsBotAñadir = new GridBagConstraints();
		constraintsBotAñadir.gridx = 0;
		constraintsBotAñadir.gridy = 0;

		JButton botAñadir = new JButton("Añadir");

		ActionListener pulsarAñadir = new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				Container pane2 = getContentPane();

				JFileChooser chooser = new JFileChooser();
				chooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
				chooser.showSaveDialog(null);

				String filename = chooser.getSelectedFile().getName();

				pane2.add(chooser);

				setVisible(true);
				setDefaultCloseOperation(EXIT_ON_CLOSE);
				pack();
				setResizable(false);

			}
		};

		// Boton Eliminar
		GridBagConstraints constraintsBotEliminar = new GridBagConstraints();
		constraintsBotEliminar.gridx = 1;
		constraintsBotEliminar.gridy = 0;

		JButton botEliminar = new JButton("Eliminar");

		// Boton Help
		GridBagConstraints constraintsBotHelp = new GridBagConstraints();
		constraintsBotHelp.gridx = 2;
		constraintsBotHelp.gridy = 0;

		JButton botHelp = new JButton("Help");

		// Boton Exit
		GridBagConstraints constraintsBotExit = new GridBagConstraints();
		constraintsBotExit.gridx = 3;
		constraintsBotExit.gridy = 0;

		JButton botExit = new JButton("Exit");

		ActionListener cerrar = new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				ventana.removeAll();

			}
		};

		// LISTA

		DefaultListModel<String> datos = new DefaultListModel<>();
		datos.addElement(nombre);

		JList<String> jList = new JList<>(datos);

		JScrollPane listScroller = new JScrollPane(jList);
		listScroller.setPreferredSize(new Dimension(300, 200));

		GridBagConstraints constraintsLista = new GridBagConstraints();
		constraintsLista.gridx = 0;
		constraintsLista.gridy = 1;
		constraintsLista.gridwidth = 5;

		// DPI
		JLabel dpi = new JLabel("DPI");
		GridBagConstraints constraintsDpi = new GridBagConstraints();
		constraintsDpi.gridx = 0;
		constraintsDpi.gridy = 3;

		String[] tipoCompresion = { "baja", "media", "alta" };
		JComboBox<String> comboBox = new JComboBox<String>(tipoCompresion);

		GridBagConstraints constraintsCombo = new GridBagConstraints();
		constraintsCombo.gridx = 1;
		constraintsCombo.gridy = 3;

		// Output
		JLabel output = new JLabel("Output");
		GridBagConstraints constraintsOutput = new GridBagConstraints();
		constraintsOutput.gridx = 2;
		constraintsOutput.gridy = 3;

		// Output
		JTextField destino = new JTextField("RutaDestino");
		GridBagConstraints constraintsDestino = new GridBagConstraints();
		constraintsDestino.gridx = 3;
		constraintsDestino.gridy = 3;
		constraintsDestino.gridwidth = 2;

		// quality
		JLabel quality = new JLabel("Quality");
		GridBagConstraints constraintsQuality = new GridBagConstraints();
		constraintsQuality.gridx = 0;
		constraintsQuality.gridy = 4;
		constraintsQuality.insets = new Insets(10, 0, 10, 0);

		// Slider
		JSlider slider = new JSlider(1, 3, 2);

		GridBagConstraints constraintsSlider = new GridBagConstraints();
		constraintsSlider.gridx = 1;
		constraintsSlider.gridy = 4;
		constraintsSlider.gridwidth = 4;
		
		
		ChangeListener eventSlider = new ChangeListener() {
			
			@Override
			public void stateChanged(ChangeEvent e) {
				if (slider.getValue() == 1) {
					comboBox.setSelectedItem("baja");
				}
				if (slider.getValue() == 2) {
					comboBox.setSelectedItem("media");
				}
				if (slider.getValue() == 3) {
					comboBox.setSelectedItem("alta");
				}
				
			}
		};

		// Añadir al PANE - Acciones
		botAñadir.addActionListener(pulsarAñadir);
		botExit.addActionListener(cerrar);
		slider.addChangeListener(eventSlider);
		

		// Añadir al PANE - Componentes
		ventana.add(botAñadir, constraintsBotAñadir);
		ventana.add(botEliminar, constraintsBotEliminar);
		ventana.add(botHelp, constraintsBotHelp);
		ventana.add(botExit, constraintsBotExit);
		ventana.add(listScroller, constraintsLista);
		ventana.add(comboBox, constraintsCombo);
		ventana.add(dpi, constraintsDpi);
		ventana.add(output, constraintsOutput);
		ventana.add(destino, constraintsDestino);
		ventana.add(slider, constraintsSlider);
		ventana.add(quality, constraintsQuality);

		// Propiedades ventana
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		pack();
		setResizable(false);

	}

	public static void main(String[] args) {
		new CompresorPDF();
	}
}
