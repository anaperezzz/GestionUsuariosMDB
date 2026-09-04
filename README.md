# GestionUsuarios
![El Salvador](https://img.shields.io/badge/Country-El%20Salvador-0047AB?style=for-the-badge)
![C#](https://img.shields.io/badge/C%23-239120?style=for-the-badge&logo=c-sharp&logoColor=white)
![NET](https://img.shields.io/badge/.NET-5C2D91?style=for-the-badge&logo=dotnet&logoColor=white)
![WPF](https://img.shields.io/badge/WPF-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)

Sistema de gestión de usuarios desarrollado en **WPF (.NET)** y **C#**, con persistencia de datos mediante **SQL Server**, utilizando el driver oficial `Microsoft.Data.SqlClient`.

Esta practica permite:

- Listar todos los usuarios registrados en la base de datos.
- Registrar nuevos usuarios (Nombre, Apellido, Email, País).
- Editar la información de un usuario existente.
- Eliminar un usuario seleccionado, con confirmación previa.
- Consultar la base de datos relacional `GestionUsuarios` en SQL Server.

---

## Características

- **Arquitectura en capas (DTO / DAO):** separación entre el transporte de datos (`UsuarioDto`), el acceso a datos (`UsuarioDao`) y la conexión (`DBConnection`).
- **Interfaz construida en XAML:** ventanas `MainWindow` (listado) y `FrmUsuario` (alta/edición) diseñadas con controles nativos de WPF (`DataGrid`, `TextBox`, `Button`, `Label`).
- **Reutilización de formulario:** `FrmUsuario` sirve tanto para crear como para editar usuarios, dependiendo de si recibe un `Id` en el constructor.
- **Conexión centralizada:** toda la cadena de conexión vive en una sola clase (`DBConnection.cs`), evitando duplicar credenciales en el proyecto.
- **Manejo de paquetes NuGet:** dependencia gestionada vía `Microsoft.Data.SqlClient`.

---

## Diseño y desarrollo técnico

La aplicación fue desarrollada bajo un esquema modular en **WPF**, separando la lógica de presentación (`.xaml`) de la lógica de negocio (`.xaml.cs`).

Aspectos técnicos destacados:

- **Clase de Conexión (`DBConnection.cs`):** centraliza el *Connection String* y entrega objetos `SqlConnection` listos para usar.
- **Capa DTO (`UsuarioDto.cs`):** representa un usuario en memoria, sin lógica de negocio.
- **Capa DAO (`UsuarioDao.cs`):** contiene todas las operaciones CRUD contra la tabla `usuarios` (Obtener, Agregar, Actualizar, Eliminar).
- **Vistas (`MainWindow.xaml`, `FrmUsuario.xaml`):** interfaz gráfica de listado y de captura/edición, respectivamente.

---

## Estructura del proyecto

```text
.
├── GestionUsuarios.sln
└── GestionUsuarios/
    ├── imgs/
    │   ├── nuevo.png
    │   ├── editar.png
    │   ├── eliminar.png
    │   └── guardar.png
    ├── QueryBD
    │   ├── GestionUsuarios.sql
    ├── App.xaml
    ├── AssemblyInfo.cs
    ├── DBConnection.cs
    ├── UsuarioDto.cs
    ├── UsuarioDao.cs
    ├── MainWindow.xaml
    ├── MainWindow.xaml.cs
    ├── FrmUsuario.xaml
    └── FrmUsuario.xaml.cs
```

---

## Funcionalidades disponibles

### Gestión de base de datos

- **Conexión directa:** manejo de sesiones de lectura y escritura sobre la base de datos `GestionUsuarios` en SQL Server.
- **Operaciones CRUD:** consulta, inserción, edición y eliminación de usuarios.

### Interfaz e interacción

- **Listado principal (`MainWindow`):** muestra todos los usuarios en un `DataGrid`, con botones para Nuevo, Editar y Eliminar.
- **Formulario de usuario (`FrmUsuario`):** captura Nombre, Apellido, Email y País. El campo `Id` es autogenerado por SQL Server (`IDENTITY(1,1)`), por lo que no se solicita manualmente.

---

## Base de datos

La tabla principal es `usuarios`:

```sql
create database GestionUsuarios
go

use GestionUsuarios

create table usuarios(
    usr_id int identity(1,1) PRIMARY KEY,
    usr_nombre varchar(45) NOT NULL,
    usr_apellido varchar(45) NOT NULL,
    usr_email varchar(150) NOT NULL,
    usr_pais varchar(45) NOT NULL
)
```

> `usr_id` es autoincremental (`IDENTITY`), por eso el formulario de captura solo pide 4 datos: Nombre, Apellido, Email y País. El Id se asigna automáticamente al insertar.

El script completo de creación e inserción de datos de prueba se encuentra en el repositorio.

---

## Ejecutar el proyecto

### Requisitos previos

- **Visual Studio** (2022 o superior) con la carga de trabajo **Desarrollo de escritorio de .NET**.
- **SQL Server** (local o remoto) con la base de datos `GestionUsuarios` creada.
- Paquete NuGet **Microsoft.Data.SqlClient**.

### Instrucciones

1. Clone o descargue este repositorio.
2. Abra el archivo de solución:

```
GestionUsuarios.sln
```

3. Restaure los paquetes **NuGet** si Visual Studio lo solicita.
4. Edite la cadena de conexión en `DBConnection.cs` con el nombre de su servidor y credenciales:

```csharp
private string ConnectionString =
    "Data Source=SU_SERVIDOR;Initial Catalog=GestionUsuarios;User ID=sa;Password=SU_PASSWORD;Encrypt=True;TrustServerCertificate=True;";
```

5. Presione **F5** o haga clic en **Iniciar** para compilar y ejecutar la aplicación.

---

## Reglas de conexión y backend

El acceso a la base de datos se encuentra centralizado en la clase `DBConnection.cs`, la cual establece la conexión con SQL Server mediante una cadena de conexión.

```csharp
using Microsoft.Data.SqlClient;

internal class DBConnection
{
    private string ConnectionString =
        "Data Source=SU_SERVIDOR;Initial Catalog=GestionUsuarios;User ID=sa;Password=SU_PASSWORD;Encrypt=True;TrustServerCertificate=True;";

    public SqlConnection ObtenerConexion()
    {
        SqlConnection connection = new SqlConnection(ConnectionString);
        return connection;
    }
}
```

---

## Aviso

Esta aplicación fue desarrollada con fines académicos y educativos para la gestión de usuarios y roles, utilizando tecnologías de escritorio basadas en **C#**, **WPF** y **SQL Server**.
