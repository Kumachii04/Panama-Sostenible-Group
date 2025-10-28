-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 28, 2025 at 11:42 PM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `panama_sostenible_group`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `imagen_categoria` varchar(255) DEFAULT NULL,
  `color` varchar(7) DEFAULT '#2E8B57',
  `tipo_sostenibilidad` enum('economica','social','ambiental') DEFAULT 'economica',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `imagen_categoria`, `color`, `tipo_sostenibilidad`, `created_at`) VALUES
(1, 'Guías Turísticos', 'Servicios de guías locales certificados y profesionales', 'guias_turisticos.jpg', '#2E8B57', 'economica', '2025-10-28 02:46:19'),
(2, 'Reparaciones y Mantenimiento', 'Técnicos especializados en reparación de equipos y electrodomésticos', 'reparaciones.jpg', '#1E90FF', 'economica', '2025-10-28 02:46:19'),
(3, 'Transporte Local', 'Servicios de transporte confiable y accesible', 'transporte_local.jpg', '#FF8C00', 'social', '2025-10-28 02:46:19'),
(4, 'Educación y Tutorías', 'Servicios educativos y de reforzamiento académico', 'educacion.jpg', '#8A2BE2', 'social', '2025-10-28 02:46:19'),
(5, 'Gastronomía Local', 'Chefs y servicios de comida con ingredientes locales', 'gastronomia.jpg', '#DC143C', 'economica', '2025-10-28 02:46:19'),
(6, 'Tecnología y Soporte TI', 'Servicios técnicos y soporte en tecnología', 'tecnologia.jpg', '#00CED1', 'economica', '2025-10-28 02:46:19'),
(7, 'Construcción y Remodelación', 'Constructores y mano de obra especializada', 'construccion.jpg', '#A0522D', 'economica', '2025-10-28 02:46:19'),
(8, 'Bienestar y Salud', 'Servicios de salud preventiva y cuidado personal', 'bienestar.jpg', '#87CEEB', 'social', '2025-10-28 02:46:19'),
(9, 'Artesanías y Productos Locales', 'Productos elaborados por artesanos locales', 'assets\\icons\\art.jpg', '#CD853F', 'social', '2025-10-28 02:46:19'),
(10, 'Eventos y Celebraciones', 'Organización y servicios para eventos', 'eventos.jpg', '#FF69B4', 'social', '2025-10-28 02:46:19'),
(11, 'Limpieza y Organización', 'Servicios de limpieza residencial y comercial', 'limpieza.jpg', '#808080', 'economica', '2025-10-28 02:46:19'),
(12, 'Consultoría Profesional', 'Asesoría en negocios, legal y otros servicios profesionales', 'consultoria.jpg', '#4682B4', 'economica', '2025-10-28 02:46:19'),
(13, 'Cuidado de Personas', 'Cuidado de niños, adultos mayores y personas con discapacidad', 'cuidado_personas.jpg', '#32CD32', 'social', '2025-10-28 02:46:19'),
(14, 'Agricultura y Jardinería', 'Servicios agrícolas y de jardinería urbana', 'assets\\icons\\agricultura-organica-011.jpg', '#228B22', 'ambiental', '2025-10-28 02:46:19'),
(15, 'Deportes y Recreación', 'Instructores deportivos y actividades recreativas', 'deportes.jpg', '#4169E1', 'social', '2025-10-28 02:46:19'),
(16, 'Arte y Cultura', 'Servicios relacionados con arte, música y cultura local', 'assets\\icons\\cult.jpg', '#8B0000', 'social', '2025-10-28 02:46:19'),
(17, 'Logística y Mensajería', 'Servicios de entrega y mensajería local', 'logistica.jpg', '#2F4F4F', 'economica', '2025-10-28 02:46:19'),
(18, 'Medios y Comunicación', 'Fotógrafos, diseñadores y servicios de comunicación', 'medios.jpg', '#9932CC', 'economica', '2025-10-28 02:46:19'),
(19, 'Seguridad y Protección', 'Servicios de seguridad residencial y comercial', 'seguridad.jpg', '#B22222', 'social', '2025-10-28 02:46:19'),
(20, 'Energías Renovables', 'Instalación y mantenimiento de sistemas de energía limpia', 'energias_renovables.jpg', '#FFD700', 'ambiental', '2025-10-28 02:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `configuraciones`
--

CREATE TABLE `configuraciones` (
  `id` int(11) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `valor` text,
  `tipo` enum('string','number','boolean','json') DEFAULT 'string',
  `descripcion` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `configuraciones`
--

INSERT INTO `configuraciones` (`id`, `clave`, `valor`, `tipo`, `descripcion`, `created_at`) VALUES
(1, 'app_nombre', 'Panamá Sostenible Group', 'string', 'Nombre de la aplicación', '2025-10-28 02:46:20'),
(2, 'app_descripcion', 'Plataforma de servicios que promueve el desarrollo económico y social sostenible', 'string', 'Descripción de la aplicación', '2025-10-28 02:46:20'),
(3, 'contacto_email', 'info@panamasostenible.com', 'string', 'Email de contacto principal', '2025-10-28 02:46:20'),
(4, 'contacto_telefono', '+507 800-SOSTENIBLE', 'string', 'Teléfono de contacto', '2025-10-28 02:46:20'),
(5, 'max_servicios_usuario', '10', 'number', 'Máximo número de servicios por usuario', '2025-10-28 02:46:20'),
(6, 'comision_plataforma', '12', 'number', 'Porcentaje de comisión por reserva', '2025-10-28 02:46:20'),
(7, 'habilitar_reservas', 'true', 'boolean', 'Habilitar sistema de reservas', '2025-10-28 02:46:20'),
(8, 'dias_cancelacion_gratuita', '2', 'number', 'Días para cancelación gratuita', '2025-10-28 02:46:20'),
(9, 'politica_sostenibilidad', '{\"economica\": true, \"social\": true, \"ambiental\": true}', 'json', 'Tipos de sostenibilidad apoyados', '2025-10-28 02:46:20'),
(10, 'habilitar_pagos_online', 'true', 'boolean', 'Habilitar pagos en línea', '2025-10-28 02:46:20'),
(11, 'moneda_default', 'USD', 'string', 'Moneda por defecto', '2025-10-28 02:46:20'),
(12, 'idioma_default', 'es', 'string', 'Idioma por defecto', '2025-10-28 02:46:20'),
(13, 'zona_horaria', 'America/Panama', 'string', 'Zona horaria del sistema', '2025-10-28 02:46:20'),
(14, 'rating_minimo_destacado', '4.5', 'number', 'Rating mínimo para servicios destacados', '2025-10-28 02:46:20'),
(15, 'max_imagenes_servicio', '5', 'number', 'Máximo de imágenes por servicio', '2025-10-28 02:46:20'),
(16, 'tamano_max_imagen', '5', 'number', 'Tamaño máximo de imagen en MB', '2025-10-28 02:46:20'),
(17, 'soporte_whatsapp', '+507 6000-0001', 'string', 'Número de WhatsApp para soporte', '2025-10-28 02:46:20'),
(18, 'email_soporte', 'soporte@panamasostenible.com', 'string', 'Email de soporte técnico', '2025-10-28 02:46:20'),
(19, 'version_app', '2.1.0', 'string', 'Versión actual de la aplicación', '2025-10-28 02:46:20'),
(20, 'features_habilitados', '{\"chat\": true, \"pagos_online\": true, \"resenas\": true, \"favoritos\": true}', 'json', 'Features habilitados en la plataforma', '2025-10-28 02:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `favoritos`
--

INSERT INTO `favoritos` (`id`, `usuario_id`, `servicio_id`, `created_at`) VALUES
(1, 1, 1, '2025-10-28 02:46:20'),
(2, 1, 3, '2025-10-28 02:46:20'),
(3, 1, 16, '2025-10-28 02:46:20'),
(4, 2, 2, '2025-10-28 02:46:20'),
(5, 2, 6, '2025-10-28 02:46:20'),
(6, 3, 3, '2025-10-28 02:46:20'),
(7, 3, 17, '2025-10-28 02:46:20'),
(8, 4, 4, '2025-10-28 02:46:20'),
(9, 4, 15, '2025-10-28 02:46:20'),
(10, 5, 5, '2025-10-28 02:46:20'),
(11, 5, 10, '2025-10-28 02:46:20'),
(12, 6, 6, '2025-10-28 02:46:20'),
(13, 6, 19, '2025-10-28 02:46:20'),
(14, 7, 7, '2025-10-28 02:46:20'),
(15, 7, 14, '2025-10-28 02:46:20'),
(16, 8, 8, '2025-10-28 02:46:20'),
(17, 8, 13, '2025-10-28 02:46:20'),
(18, 9, 9, '2025-10-28 02:46:20'),
(19, 9, 20, '2025-10-28 02:46:20'),
(20, 10, 10, '2025-10-28 02:46:20'),
(21, 10, 11, '2025-10-28 02:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `nombre_empresa` varchar(200) NOT NULL,
  `descripcion` text,
  `categoria_id` int(11) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lng` decimal(11,8) DEFAULT NULL,
  `verificado` tinyint(1) DEFAULT '0',
  `sostenible` tinyint(1) DEFAULT '0',
  `imagen_perfil` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`id`, `usuario_id`, `nombre_empresa`, `descripcion`, `categoria_id`, `telefono`, `email`, `ubicacion`, `lat`, `lng`, `verificado`, `sostenible`, `imagen_perfil`, `created_at`) VALUES
(1, 2, 'Guías Profesionales de Panamá', 'Guías turísticos certificados con amplia experiencia en todo el país', 1, '+507 6123-4567', 'info@guiaspanama.com', 'Ciudad de Panamá', '9.00000000', '-79.50000000', 1, 1, 'guias_profesionales.jpg', '2025-10-28 02:46:19'),
(2, 3, 'TecnoRepair Panamá', 'Reparación y mantenimiento de equipos electrónicos y electrodomésticos', 2, '+507 6234-5678', 'servicio@tecnorepair.com', 'San Miguelito, Panamá', '9.03333330', '-79.50000000', 1, 1, 'tecnorepair.jpg', '2025-10-28 02:46:19'),
(3, 4, 'Transporte Seguro PA', 'Servicio de transporte confiable con conductores verificados', 3, '+507 6345-6789', 'reservas@transporteseguro.com', 'Tocumen, Panamá', '9.08333330', '-79.38333330', 1, 1, 'transporte_seguro.jpg', '2025-10-28 02:46:19'),
(4, 5, 'Academia Fortaleza', 'Servicios de tutorías y reforzamiento académico todos los niveles', 4, '+507 6456-7890', 'info@academiafortaleza.com', 'David, Chiriquí', '8.43333330', '-82.43333330', 1, 1, 'academia_fortaleza.jpg', '2025-10-28 02:46:19'),
(5, 6, 'Chef a Domicilio Panamá', 'Servicios de chef profesional para eventos y comidas especiales', 5, '+507 6567-8901', 'reservas@chefdomicilio.com', 'Punta Pacífica, Panamá', '8.98333330', '-79.51666670', 1, 1, 'chef_domicilio.jpg', '2025-10-28 02:46:19'),
(6, 7, 'Soporte TI Rápido', 'Soporte técnico especializado para empresas y hogares', 6, '+507 6678-9012', 'soporte@tirapido.com', 'Via España, Panamá', '9.01666670', '-79.53333330', 1, 1, 'soporte_ti.jpg', '2025-10-28 02:46:19'),
(7, 8, 'Constructores del Istmo', 'Servicios de construcción y remodelación con calidad garantizada', 7, '+507 6789-0123', 'proyectos@constructoresistmo.com', 'Arraiján, Panamá Oeste', '8.95000000', '-79.65000000', 1, 1, 'constructores_istmo.jpg', '2025-10-28 02:46:19'),
(8, 9, 'Bienestar Integral PA', 'Servicios de masajes terapéuticos y cuidado personal', 8, '+507 6890-1234', 'citas@bienestarintegral.com', 'El Cangrejo, Panamá', '9.01666670', '-79.51666670', 1, 1, 'bienestar_integral.jpg', '2025-10-28 02:46:19'),
(9, 10, 'Artesanías Panameñas', 'Productos artesanales auténticos de todas las regiones', 9, '+507 6901-2345', 'ventas@artesaniaspa.com', 'Casco Antiguo, Panamá', '8.95222220', '-79.53472220', 1, 1, 'artesanias_panamenas.jpg', '2025-10-28 02:46:19'),
(10, 11, 'Eventos Memorables', 'Organización completa de eventos sociales y corporativos', 10, '+507 6012-3456', 'cotizaciones@eventosmemorables.com', 'Bella Vista, Panamá', '9.00000000', '-79.51666670', 1, 1, 'eventos_memorables.jpg', '2025-10-28 02:46:19'),
(11, 12, 'Limpieza Express PA', 'Servicios de limpieza residencial y comercial eficientes', 11, '+507 6123-4567', 'citas@limpiezaexpress.com', 'La Chorrera, Panamá Oeste', '8.85000000', '-79.78333330', 1, 1, 'limpieza_express.jpg', '2025-10-28 02:46:19'),
(12, 13, 'Consultores Asociados PA', 'Asesoría legal, contable y de negocios para emprendedores', 12, '+507 6234-5678', 'consultas@consultorespa.com', 'Vía Argentina, Panamá', '9.01666670', '-79.53333330', 1, 1, 'consultores_asociados.jpg', '2025-10-28 02:46:19'),
(13, 14, 'Cuidado con Amor', 'Servicios de cuidado para adultos mayores y niños', 13, '+507 6345-6789', 'cuidado@conamor.com', 'Betania, Panamá', '9.01666670', '-79.53333330', 1, 1, 'cuidado_amor.jpg', '2025-10-28 02:46:19'),
(14, 15, 'Jardines Urbanos PA', 'Diseño y mantenimiento de jardines y huertos urbanos', 14, '+507 6456-7890', 'info@jardinesurbanos.com', 'El Dorado, Panamá', '9.03333330', '-79.53333330', 1, 1, 'jardines_urbanos.jpg', '2025-10-28 02:46:19'),
(15, 16, 'Deporte para Todos', 'Instructores deportivos y actividades recreativas inclusivas', 15, '+507 6567-8901', 'clases@deporteparatodos.com', 'Albrook, Panamá', '9.01666670', '-79.55000000', 1, 1, 'deporte_todos.jpg', '2025-10-28 02:46:19'),
(16, 17, 'Estudio Creativo PA', 'Servicios de fotografía, diseño gráfico y producción audiovisual', 18, '+507 6678-9012', 'proyectos@estudiocreativo.com', 'Obarrio, Panamá', '9.01666670', '-79.51666670', 1, 1, 'estudio_creativo.jpg', '2025-10-28 02:46:19'),
(17, 18, 'Mensajería Confiable', 'Servicios de mensajería y entregas rápidas en toda la ciudad', 17, '+507 6789-0123', 'envios@mensajeriaconfiable.com', 'Curundú, Panamá', '9.01666670', '-79.53333330', 1, 1, 'mensajeria_confiable.jpg', '2025-10-28 02:46:19'),
(18, 19, 'Seguridad Total', 'Servicios de seguridad privada y monitoreo residencial', 19, '+507 6890-1234', 'info@seguridadtotal.com', 'Paitilla, Panamá', '9.01666670', '-79.51666670', 1, 1, 'seguridad_total.jpg', '2025-10-28 02:46:19'),
(19, 20, 'Energía Solar PA', 'Instalación de paneles solares para hogares y negocios', 20, '+507 6901-2345', 'cotizaciones@energiasolarpa.com', 'San Francisco, Panamá', '9.01666670', '-79.51666670', 1, 1, 'energia_solar.jpg', '2025-10-28 02:46:19'),
(20, 1, 'Cultura Viva Panama', 'Promoción de artistas locales y talleres culturales', 16, '+507 6012-3456', 'info@culturaviva.com', 'Vía Brasil, Panamá', '9.01666670', '-79.53333330', 1, 1, 'cultura_viva.jpg', '2025-10-28 02:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `resenas`
--

CREATE TABLE `resenas` (
  `id` int(11) NOT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `reserva_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comentario` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ;

--
-- Dumping data for table `resenas`
--

INSERT INTO `resenas` (`id`, `servicio_id`, `usuario_id`, `reserva_id`, `rating`, `comentario`, `created_at`) VALUES
(1, 1, 1, 1, 5, 'El guía muy conocedor, aprendimos mucho sobre la historia de Panamá', '2025-10-28 02:46:20'),
(2, 2, 2, 2, 4, 'Rápido y eficiente, aunque un poco caro para la reparación', '2025-10-28 02:46:20'),
(3, 3, 3, 3, 5, 'Puntual y muy amable, el auto estaba impecable', '2025-10-28 02:46:20'),
(4, 4, 4, 4, 5, 'Mi hijo mejoró notablemente en matemáticas, excelente profesora', '2025-10-28 02:46:20'),
(5, 5, 5, 5, 5, 'Cena espectacular, el chef muy profesional y la comida deliciosa', '2025-10-28 02:46:20'),
(6, 6, 6, 6, 4, 'Buen servicio, resolvieron los problemas de red rápidamente', '2025-10-28 02:46:20'),
(7, 7, 7, 7, 5, 'Quedó exactamente como queríamos, muy profesionales los constructores', '2025-10-28 02:46:20'),
(8, 8, 8, 8, 5, 'Masaje relajante, justo lo que necesitaba después de una semana estresante', '2025-10-28 02:46:20'),
(9, 9, 9, 9, 5, 'Mola auténtica y hermosa, artesanía de calidad', '2025-10-28 02:46:20'),
(10, 10, 10, 10, 5, 'Organización impecable, todo salió perfecto en nuestra boda', '2025-10-28 02:46:20'),
(11, 11, 11, 11, 4, 'Limpieza profunda bien hecha, aunque faltó limpiar algunos muebles altos', '2025-10-28 02:46:20'),
(12, 12, 12, 12, 5, 'Asesoría muy valiosa para nuestro emprendimiento', '2025-10-28 02:46:20'),
(13, 13, 13, 13, 5, 'Cuidadora muy cariñosa y responsable con mi madre', '2025-10-28 02:46:20'),
(14, 14, 14, 14, 4, 'Jardín quedó bonito, esperemos que las plantas se mantengan', '2025-10-28 02:46:20'),
(15, 15, 15, 15, 5, 'Instructora muy paciente con las principiantes, clase muy amena', '2025-10-28 02:46:20'),
(16, 16, 16, 16, 5, 'Fotos espectaculares, capturaron momentos muy especiales', '2025-10-28 02:46:20'),
(17, 17, 17, 17, 4, 'Entrega a tiempo, aunque el mensajero llegó justo en el límite', '2025-10-28 02:46:20'),
(18, 18, 18, 18, 5, 'Instalación profesional, el sistema de cámaras funciona perfecto', '2025-10-28 02:46:20'),
(19, 19, 19, 19, 5, 'Excelente asesoría para el sistema solar, muy detallados', '2025-10-28 02:46:20'),
(20, 20, 20, 20, 5, 'Los niños disfrutaron mucho el taller, muy creativo', '2025-10-28 02:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `personas` int(11) DEFAULT '1',
  `estado` enum('pendiente','confirmada','cancelada','completada') DEFAULT 'pendiente',
  `total` decimal(10,2) DEFAULT NULL,
  `notas` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reservas`
--

INSERT INTO `reservas` (`id`, `servicio_id`, `usuario_id`, `fecha_inicio`, `fecha_fin`, `personas`, `estado`, `total`, `notas`, `created_at`) VALUES
(1, 1, 1, '2024-03-15 09:00:00', '2024-03-15 12:00:00', 2, 'completada', '50.00', 'Turistas españoles interesados en historia', '2025-10-28 02:46:20'),
(2, 2, 2, '2024-03-16 14:00:00', '2024-03-16 16:00:00', 1, 'completada', '80.00', 'Laptop no enciende, necesita diagnóstico', '2025-10-28 02:46:20'),
(3, 3, 3, '2024-03-17 10:00:00', '2024-03-17 11:00:00', 1, 'confirmada', '30.00', 'Llegada vuelo CM 101, aeropuerto Tocumen', '2025-10-28 02:46:20'),
(4, 4, 4, '2024-03-18 16:00:00', '2024-03-18 17:00:00', 1, 'confirmada', '20.00', 'Estudiante de 15 años, necesita ayuda con álgebra', '2025-10-28 02:46:20'),
(5, 5, 5, '2024-03-19 19:00:00', '2024-03-19 22:00:00', 2, 'pendiente', '120.00', 'Aniversario de bodas, menu sorpresa', '2025-10-28 02:46:20'),
(6, 6, 6, '2024-03-20 08:00:00', '2024-03-20 12:00:00', 1, 'confirmada', '200.00', 'Mantenimiento preventivo oficina, 10 computadoras', '2025-10-28 02:46:20'),
(7, 7, 7, '2024-04-01 08:00:00', '2024-04-20 17:00:00', 1, 'confirmada', '2500.00', 'Remodelación cocina completa, aprox 15m2', '2025-10-28 02:46:20'),
(8, 8, 8, '2024-03-21 15:00:00', '2024-03-21 16:00:00', 1, 'completada', '45.00', 'Masaje para aliviar dolor de espalda', '2025-10-28 02:46:20'),
(9, 9, 9, '2024-03-22 11:00:00', '2024-03-22 12:00:00', 1, 'completada', '35.00', 'Compra mola para regalo, diseño tradicional', '2025-10-28 02:46:20'),
(10, 10, 10, '2024-06-15 07:00:00', '2024-06-15 23:00:00', 1, 'confirmada', '1500.00', 'Boda en jardín, 80 invitados', '2025-10-28 02:46:20'),
(11, 11, 11, '2024-03-23 09:00:00', '2024-03-23 17:00:00', 1, 'completada', '80.00', 'Limpieza profunda apartamento 3 habitaciones', '2025-10-28 02:46:20'),
(12, 12, 12, '2024-03-24 10:00:00', '2024-03-24 12:00:00', 1, 'pendiente', '150.00', 'Consulta para nuevo restaurante', '2025-10-28 02:46:20'),
(13, 13, 13, '2024-03-25 08:00:00', '2024-03-25 12:00:00', 1, 'confirmada', '60.00', 'Cuidado de señora de 78 años, necesita compañía', '2025-10-28 02:46:20'),
(14, 14, 14, '2024-04-05 08:00:00', '2024-04-07 17:00:00', 1, 'confirmada', '800.00', 'Jardín vertical en pared de 4m x 3m', '2025-10-28 02:46:20'),
(15, 15, 15, '2024-03-26 17:00:00', '2024-03-26 18:00:00', 8, 'completada', '96.00', 'Grupo de amigas principiantes en yoga', '2025-10-28 02:46:20'),
(16, 16, 16, '2024-03-27 14:00:00', '2024-03-27 16:00:00', 4, 'confirmada', '150.00', 'Sesión familiar en Parque Omar', '2025-10-28 02:46:20'),
(17, 17, 17, '2024-03-28 10:00:00', '2024-03-28 11:00:00', 1, 'completada', '10.00', 'Entrega de documentos urgentes a banco', '2025-10-28 02:46:20'),
(18, 18, 18, '2024-04-10 08:00:00', '2024-04-10 14:00:00', 1, 'confirmada', '300.00', 'Instalación 4 cámaras en residencia', '2025-10-28 02:46:20'),
(19, 19, 19, '2024-05-01 08:00:00', '2024-05-05 17:00:00', 1, 'pendiente', '3500.00', 'Sistema solar para casa en Cerro Viento', '2025-10-28 02:46:20'),
(20, 20, 20, '2024-03-29 15:00:00', '2024-03-29 16:30:00', 6, 'completada', '108.00', 'Cumpleaños infantil, taller de pintura', '2025-10-28 02:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) DEFAULT NULL,
  `tipo_precio` enum('hora','dia','persona','fijo','proyecto') DEFAULT NULL,
  `imagenes` json DEFAULT NULL,
  `disponibilidad` tinyint(1) DEFAULT '1',
  `caracteristicas` json DEFAULT NULL,
  `rating_promedio` decimal(3,2) DEFAULT '0.00',
  `total_resenas` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `servicios`
--

INSERT INTO `servicios` (`id`, `proveedor_id`, `titulo`, `descripcion`, `precio`, `tipo_precio`, `imagenes`, `disponibilidad`, `caracteristicas`, `rating_promedio`, `total_resenas`, `created_at`) VALUES
(1, 1, 'Tour Histórico Casco Antiguo', 'Recorrido guiado por el Casco Antiguo con explicaciones históricas detalladas', '25.00', 'persona', '[\"casco1.jpg\", \"casco2.jpg\"]', 1, '{\"idiomas\": [\"español\", \"inglés\"], \"incluye\": \"entradas a museos\", \"duracion\": \"3 horas\"}', '4.80', 34, '2025-10-28 02:46:19'),
(2, 2, 'Reparación de Computadoras', 'Reparación y mantenimiento de computadoras de escritorio y laptops', '40.00', 'hora', '[\"reparacion1.jpg\", \"reparacion2.jpg\"]', 1, '{\"servicios\": [\"limpieza\", \"software\", \"hardware\"], \"tipo_equipos\": [\"laptop\", \"desktop\", \"all-in-one\"]}', '4.60', 28, '2025-10-28 02:46:19'),
(3, 3, 'Transporte Aeropuerto-Hotel', 'Servicio de transporte confiable desde el aeropuerto a su hotel', '30.00', 'fijo', '[\"transporte1.jpg\", \"transporte2.jpg\"]', 1, '{\"incluye\": [\"wifi\", \"agua\"], \"vehiculo\": \"sedan\", \"capacidad\": 4}', '4.70', 45, '2025-10-28 02:46:19'),
(4, 4, 'Tutorías de Matemáticas', 'Clases personalizadas de matemáticas para estudiantes de secundaria', '20.00', 'hora', '[\"tutoria1.jpg\", \"tutoria2.jpg\"]', 1, '{\"niveles\": [\"primaria\", \"secundaria\", \"universidad\"], \"modalidad\": [\"presencial\", \"virtual\"]}', '4.90', 22, '2025-10-28 02:46:19'),
(5, 5, 'Cena Romántica en Casa', 'Servicio de chef a domicilio para cenas especiales y románticas', '120.00', 'fijo', '[\"cena1.jpg\", \"cena2.jpg\"]', 1, '{\"platos\": 3, \"incluye\": [\"preparación\", \"servicio\", \"limpieza\"], \"comensales\": 2}', '4.80', 18, '2025-10-28 02:46:19'),
(6, 6, 'Soporte TI para Oficinas', 'Mantenimiento preventivo y correctivo para equipos de oficina', '50.00', 'hora', '[\"soporte1.jpg\", \"soporte2.jpg\"]', 1, '{\"equipos\": [\"redes\", \"impresoras\", \"servidores\"], \"cobertura\": \"24/7\", \"response_time\": \"2 horas\"}', '4.50', 15, '2025-10-28 02:46:19'),
(7, 7, 'Remodelación de Cocinas', 'Servicio completo de remodelación y diseño de cocinas', '2500.00', 'proyecto', '[\"cocina1.jpg\", \"cocina2.jpg\"]', 1, '{\"incluye\": [\"diseño\", \"materiales\", \"mano_obra\"], \"duracion\": \"2-3 semanas\"}', '4.70', 12, '2025-10-28 02:46:19'),
(8, 8, 'Masaje Terapéutico', 'Sesiones de masaje terapéutico para alivio de tensiones', '45.00', 'hora', '[\"masaje1.jpg\", \"masaje2.jpg\"]', 1, '{\"tecnicas\": [\"sueca\", \"descontracturante\", \"piedras_calientes\"], \"certificacion\": true}', '4.90', 38, '2025-10-28 02:46:19'),
(9, 9, 'Molas Artesanales', 'Venta de molas guna auténticas y otros productos artesanales', '35.00', 'fijo', '[\"molas1.jpg\", \"molas2.jpg\"]', 1, '{\"origen\": \"Guna_Yala\", \"material\": \"tela_100_algodon\", \"elaboracion\": \"manual\"}', '4.80', 25, '2025-10-28 02:46:19'),
(10, 10, 'Organización de Bodas', 'Coordinación completa para bodas y eventos especiales', '1500.00', 'proyecto', '[\"boda1.jpg\", \"boda2.jpg\"]', 1, '{\"servicios\": [\"coordinacion\", \"proveedores\", \"logistica\"], \"experiencia\": \"5 años\"}', '4.90', 20, '2025-10-28 02:46:19'),
(11, 11, 'Limpieza Residencial Profunda', 'Servicio completo de limpieza para hogares', '80.00', 'dia', '[\"limpieza1.jpg\", \"limpieza2.jpg\"]', 1, '{\"incluye\": [\"cocina\", \"banos\", \"pisos\", \"ventanas\"], \"superficie\": \"hasta 150m2\"}', '4.60', 30, '2025-10-28 02:46:19'),
(12, 12, 'Consultoría para Emprendedores', 'Asesoría legal y de negocios para nuevos emprendimientos', '75.00', 'hora', '[\"consultoria1.jpg\", \"consultoria2.jpg\"]', 1, '{\"experiencia\": \"10+ años\", \"especialidades\": [\"plan_negocios\", \"legal\", \"marketing\"]}', '4.70', 16, '2025-10-28 02:46:19'),
(13, 13, 'Cuidado de Adultos Mayores', 'Servicio de acompañamiento y cuidado para personas mayores', '15.00', 'hora', '[\"cuidado1.jpg\", \"cuidado2.jpg\"]', 1, '{\"servicios\": [\"compania\", \"medicacion\", \"alimentacion\"], \"certificacion\": \"primeros_auxilios\"}', '4.90', 42, '2025-10-28 02:46:19'),
(14, 14, 'Diseño de Jardines Verticales', 'Creación de jardines verticales para espacios urbanos', '800.00', 'proyecto', '[\"jardin1.jpg\", \"jardin2.jpg\"]', 1, '{\"plantas\": \"nativas\", \"mantenimiento\": \"incluido_3_meses\", \"sistema_riego\": \"automatico\"}', '4.80', 14, '2025-10-28 02:46:19'),
(15, 15, 'Clases de Yoga para Principiantes', 'Sesiones de yoga adaptadas para personas que inician', '12.00', 'persona', '[\"yoga1.jpg\", \"yoga2.jpg\"]', 1, '{\"nivel\": \"principiante\", \"duracion\": \"1 hora\", \"incluye_mat\": true}', '4.70', 35, '2025-10-28 02:46:19'),
(16, 16, 'Sesión de Fotos Profesional', 'Sesión fotográfica para retratos individuales o familiares', '150.00', 'fijo', '[\"fotos1.jpg\", \"fotos2.jpg\"]', 1, '{\"incluye\": [\"maquillaje\", \"locacion\"], \"duracion\": \"2 horas\", \"fotos_editadas\": 20}', '4.80', 28, '2025-10-28 02:46:19'),
(17, 17, 'Mensajería Urgente', 'Servicio de mensajería express en ciudad capital', '10.00', 'fijo', '[\"mensajeria1.jpg\", \"mensajeria2.jpg\"]', 1, '{\"cobertura\": \"area_metropolitana\", \"seguimiento\": \"online\", \"tiempo_entrega\": \"1-2 horas\"}', '4.50', 50, '2025-10-28 02:46:19'),
(18, 18, 'Instalación de Cámaras de Seguridad', 'Instalación profesional de sistemas de seguridad para hogares', '300.00', 'proyecto', '[\"camaras1.jpg\", \"camaras2.jpg\"]', 1, '{\"equipos\": \"incluidos\", \"garantia\": \"1 ano\", \"monitoreo\": \"opcional\"}', '4.60', 19, '2025-10-28 02:46:19'),
(19, 19, 'Instalación de Paneles Solares', 'Sistema completo de energía solar para vivienda media', '3500.00', 'proyecto', '[\"solar1.jpg\", \"solar2.jpg\"]', 1, '{\"garantia\": \"10 anos\", \"capacidad\": \"3kW\", \"ahorro_estimado\": \"70%\"}', '4.90', 11, '2025-10-28 02:46:19'),
(20, 20, 'Taller de Pintura para Niños', 'Clases de pintura y expresión artística para niños', '18.00', 'persona', '[\"pintura1.jpg\", \"pintura2.jpg\"]', 1, '{\"edad\": \"5-12 anos\", \"duracion\": \"1.5 horas\", \"materiales\": \"incluidos\"}', '4.80', 23, '2025-10-28 02:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `rol` enum('user','admin') DEFAULT 'user',
  `activo` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `telefono`, `username`, `rol`, `activo`, `created_at`) VALUES
(1, 'María González', 'maria.gonzalez@email.com', '$2y$10$ABC123', '+507 6123-4567', 'maria_g', 'user', 1, '2025-10-28 02:46:19'),
(2, 'Carlos Rodríguez', 'carlos.rodriguez@email.com', '$2y$10$DEF456', '+507 6234-5678', 'carlos_r', 'user', 1, '2025-10-28 02:46:19'),
(3, 'Ana Martínez', 'ana.martinez@email.com', '$2y$10$GHI789', '+507 6345-6789', 'ana_m', 'admin', 1, '2025-10-28 02:46:19'),
(4, 'José Pérez', 'jose.perez@email.com', '$2y$10$JKL012', '+507 6456-7890', 'jose_p', 'user', 1, '2025-10-28 02:46:19'),
(5, 'Laura Herrera', 'laura.herrera@email.com', '$2y$10$MNO345', '+507 6567-8901', 'laura_h', 'user', 1, '2025-10-28 02:46:19'),
(6, 'Roberto Silva', 'roberto.silva@email.com', '$2y$10$PQR678', '+507 6678-9012', 'roberto_s', 'user', 1, '2025-10-28 02:46:19'),
(7, 'Isabel Castro', 'isabel.castro@email.com', '$2y$10$STU901', '+507 6789-0123', 'isabel_c', 'user', 1, '2025-10-28 02:46:19'),
(8, 'Miguel Ángel Díaz', 'miguel.diaz@email.com', '$2y$10$VWX234', '+507 6890-1234', 'miguel_d', 'user', 1, '2025-10-28 02:46:19'),
(9, 'Elena Morales', 'elena.morales@email.com', '$2y$10$YZA567', '+507 6901-2345', 'elena_m', 'user', 1, '2025-10-28 02:46:19'),
(10, 'Fernando Ríos', 'fernando.rios@email.com', '$2y$10$BCD890', '+507 6012-3456', 'fernando_r', 'user', 1, '2025-10-28 02:46:19'),
(11, 'Sofía Mendoza', 'sofia.mendoza@email.com', '$2y$10$CDE123', '+507 6123-4567', 'sofia_m', 'user', 1, '2025-10-28 02:46:19'),
(12, 'Ricardo Vega', 'ricardo.vega@email.com', '$2y$10$EFG456', '+507 6234-5678', 'ricardo_v', 'user', 1, '2025-10-28 02:46:19'),
(13, 'Patricia López', 'patricia.lopez@email.com', '$2y$10$HIJ789', '+507 6345-6789', 'patricia_l', 'user', 1, '2025-10-28 02:46:19'),
(14, 'Javier Mendoza', 'javier.mendoza@email.com', '$2y$10$KLM012', '+507 6456-7890', 'javier_m', 'user', 1, '2025-10-28 02:46:19'),
(15, 'Carmen Ruiz', 'carmen.ruiz@email.com', '$2y$10$NOP345', '+507 6567-8901', 'carmen_r', 'user', 1, '2025-10-28 02:46:19'),
(16, 'Alberto Sánchez', 'alberto.sanchez@email.com', '$2y$10$QRS678', '+507 6678-9012', 'alberto_s', 'user', 1, '2025-10-28 02:46:19'),
(17, 'Daniela Torres', 'daniela.torres@email.com', '$2y$10$TUV901', '+507 6789-0123', 'daniela_t', 'user', 1, '2025-10-28 02:46:19'),
(18, 'Luis Navarro', 'luis.navarro@email.com', '$2y$10$WXY234', '+507 6890-1234', 'luis_n', 'user', 1, '2025-10-28 02:46:19'),
(19, 'Gabriela Ortega', 'gabriela.ortega@email.com', '$2y$10$ZAB567', '+507 6901-2345', 'gabriela_o', 'user', 1, '2025-10-28 02:46:19'),
(20, 'Administrador Sistema', 'admin@panamasostenible.com', '$2y$10$ADMIN123', '+507 6000-0000', 'admin_sistema', 'admin', 1, '2025-10-28 02:46:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuraciones`
--
ALTER TABLE `configuraciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clave` (`clave`);

--
-- Indexes for table `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_usuario_servicio` (`usuario_id`,`servicio_id`),
  ADD KEY `servicio_id` (`servicio_id`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indexes for table `resenas`
--
ALTER TABLE `resenas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_reserva_resena` (`reserva_id`),
  ADD KEY `servicio_id` (`servicio_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `servicio_id` (`servicio_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `configuraciones`
--
ALTER TABLE `configuraciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `resenas`
--
ALTER TABLE `resenas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Constraints for table `resenas`
--
ALTER TABLE `resenas`
  ADD CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resenas_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resenas_ibfk_3` FOREIGN KEY (`reserva_id`) REFERENCES `reservas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`servicio_id`) REFERENCES `servicios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
