# To-Do List App
Una aplicación Flutter simple para crear, gestionar y visualizar una lista de tareas pendientes, con opciones para agregar, marcar como completadas y eliminar tareas fácilmente.

## Descripción
Esta app permite:
- Agregar nuevas tareas en forma de lista.
- Marcar tareas como completadas.
- Eliminar tareas de la lista fácilmente.
- Visualizar las tareas pendientes y completadas de forma clara.
- Cambiar entre tema **claro** y **oscuro** de forma dinámica.

## Características principales  
- Uso de **Riverpod** para la gestión del estado global.  
- **StateNotifierProvider** para manejar la lista de tareas y el tema de la app.  
- **StatefulWidget** para controlar el ciclo de vida de los controladores de texto y foco.  
- **TextEditingController** y **FocusNode** para gestionar la entrada y el enfoque del campo de texto de nuevas tareas.  
- **ListView.builder** para mostrar la lista de tareas.  
- **CheckboxListTile** para marcar tareas como completadas y **IconButton** para eliminarlas.  
- Validación de entrada: solo se agregan tareas si el campo de texto no está vacío.  
- **Tema personalizable**: modo claro/oscuro.

## Capturas de pantalla

- **Pantalla Principal**

![PantallaPrincipal](https://i.postimg.cc/Dw24rYvq/pantalla-Principal-TD.png)
 
- **Agregar Tarea**

![AgregarTarea](https://i.postimg.cc/pdKd3fL2/Agregar-Tarea-TD.png)

- **Marcar Tareas Hechas**

![MarcarTareasHechas](https://i.postimg.cc/VNwwr3z8/Marcar-Tareas-TD.png)

- **Eliminar Tarea**

![EliminarTarea](https://i.postimg.cc/tJ8QXcB8/Eliminar-Tarea-TD.png)

- **Cambio de tema**

![CambioDeTema](https://i.postimg.cc/yYSCfVdK/Cambio-Tema-TD.png)

## Instalación
1. Clona el repositorio:
	```bash
	git clone https://github.com/IvanCS719/simple_todo_list_app.git
	cd tip_calculator_flutter
	```
2. Instala las dependencias:
	```bash
	flutter pub get
	```
3. Ejecuta la app:
	```bash
	flutter run
	```

## Uso
1. Ingresa el titulo o descripcion de la tarea.
2. Marca la tarea en el checkbox cuando este completada.
3. Elimina la tarea si no la necesitas más.
4. Cambia entre modo **claro** y **oscuro** desde el botón de tema.

## Estructura del proyecto
- `lib/`  
  - `presentation/` - Pantallas, widgets de la interfaz y providers.
  - `domain/` - Lógica de negocio y entidades.
  - `config/` - Temas y configuración.

## Temas aplicados
- Manejo de estado con StatefulWidget.
- Control de campos de texto con TextEditingController y FocusNode.
- Widgets de Material Design.
- Gestión global con Riverpod.
- Personalización de tema con cambio claro/oscuro.

## Notas
- Esta aplicación fue desarrollada como práctica de Flutter, aplicando los conceptos básicos aprendidos.
- Es una app sencilla pero funcional, ideal para reforzar fundamentos de Flutter.

## Author
- GitHub [@IvanDroid](https://github.com/IvanCS719)
