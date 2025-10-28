<?php
session_start();
if(!isset($_SESSION['user_id']) || $_SESSION['user_role'] != 'admin') {
    header('Location: ../login.php');
    exit;
}

$pageTitle = "Configuración del Sistema";
include '../../includes/header.php';
include '../../includes/database.php';

$database = new Database();
$conn = $database->getConnection();

// Procesar configuración
if($_POST) {
    // Aquí iría la lógica para guardar configuraciones
    $message = "Configuración actualizada correctamente";
}
?>

<div class="admin-dashboard">
    <div class="admin-sidebar">
        <h2>Panel Admin</h2>
        <nav class="admin-nav">
            <a href="dashboard.php">📊 Dashboard</a>
            <a href="gestion-servicios.php">🛍️ Servicios</a>
            <a href="gestion-proveedores.php">👥 Proveedores</a>
            <a href="gestion-reservas.php">📅 Reservas</a>
            <a href="gestion-usuarios.php">👤 Usuarios</a>
            <a href="configuracion.php" class="active">⚙️ Configuración</a>
        </nav>
    </div>

    <div class="admin-content">
        <div class="admin-header">
            <h1>Configuración del Sistema</h1>
            <p>Configura los parámetros generales de la plataforma</p>
        </div>

        <!-- Mensajes -->
        <?php if(isset($message)): ?>
        <div class="alert alert-success">
            <?= $message ?>
        </div>
        <?php endif; ?>

        <form method="POST" class="config-form">
            <!-- Configuración General -->
            <div class="config-section">
                <h3>⚙️ Configuración General</h3>

                <div class="form-group">
                    <label>Nombre de la Plataforma</label>
                    <input type="text" name="site_name" value="Panamá Sostenible Group" class="form-control">
                </div>

                <div class="form-group">
                    <label>Descripción del Sitio</label>
                    <textarea name="site_description" class="form-control"
                        rows="3">Plataforma de servicios turísticos sostenibles en Panamá</textarea>
                </div>

                <div class="form-group">
                    <label>Email de Contacto</label>
                    <input type="email" name="contact_email" value="info@panamasostenible.com" class="form-control">
                </div>

                <div class="form-group">
                    <label>Teléfono de Contacto</label>
                    <input type="text" name="contact_phone" value="+507 123-4567" class="form-control">
                </div>
            </div>

            <!-- Configuración de Comisiones -->
            <div class="config-section">
                <h3>💰 Configuración de Comisiones</h3>

                <div class="form-group">
                    <label>Comisión por Reserva (%)</label>
                    <input type="number" name="commission_rate" value="10" min="0" max="50" step="0.1"
                        class="form-control">
                    <small>Porcentaje que se cobra por cada reserva</small>
                </div>

                <div class="form-group">
                    <label>Comisión Mínima</label>
                    <input type="number" name="min_commission" value="1.00" min="0" step="0.01" class="form-control">
                </div>
            </div>

            <!-- Configuración de Pagos -->
            <div class="config-section">
                <h3>💳 Configuración de Pagos</h3>

                <div class="form-group">
                    <label>Métodos de Pago Habilitados</label>
                    <div class="checkbox-group">
                        <label>
                            <input type="checkbox" name="payment_methods[]" value="credit_card" checked>
                            Tarjeta de Crédito
                        </label>
                        <label>
                            <input type="checkbox" name="payment_methods[]" value="debit_card" checked>
                            Tarjeta de Débito
                        </label>
                        <label>
                            <input type="checkbox" name="payment_methods[]" value="paypal">
                            PayPal
                        </label>
                        <label>
                            <input type="checkbox" name="payment_methods[]" value="bank_transfer">
                            Transferencia Bancaria
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label>Moneda Principal</label>
                    <select name="currency" class="form-control">
                        <option value="USD" selected>Dólar Americano (USD)</option>
                        <option value="PAB">Balboa Panameño (PAB)</option>
                    </select>
                </div>
            </div>

            <!-- Configuración de Notificaciones -->
            <div class="config-section">
                <h3>🔔 Configuración de Notificaciones</h3>

                <div class="form-group">
                    <label>Email para Notificaciones</label>
                    <input type="email" name="notification_email" value="notificaciones@panamasostenible.com"
                        class="form-control">
                </div>

                <div class="checkbox-group">
                    <label>
                        <input type="checkbox" name="notify_new_reservations" checked>
                        Notificar nuevas reservas
                    </label>
                    <label>
                        <input type="checkbox" name="notify_new_providers" checked>
                        Notificar nuevos proveedores
                    </label>
                    <label>
                        <input type="checkbox" name="notify_cancellations" checked>
                        Notificar cancelaciones
                    </label>
                </div>
            </div>

            <!-- Configuración de Sostenibilidad -->
            <div class="config-section">
                <h3>🌱 Configuración de Sostenibilidad</h3>

                <div class="form-group">
                    <label>Criterios para Verificación Sostenible</label>
                    <textarea name="sustainability_criteria" class="form-control" rows="4">
- Prácticas ambientales responsables
- Apoyo a comunidades locales
- Uso de recursos renovables
- Reducción de huella de carbono
- Educación ambiental
                    </textarea>
                </div>

                <div class="form-group">
                    <label>Porcentaje Mínimo para Sostenibilidad</label>
                    <input type="number" name="sustainability_threshold" value="70" min="0" max="100"
                        class="form-control">
                    <small>Porcentaje mínimo de criterios que debe cumplir un proveedor</small>
                </div>
            </div>

            <!-- Configuración de SEO -->
            <div class="config-section">
                <h3>🔍 Configuración SEO</h3>

                <div class="form-group">
                    <label>Meta Keywords</label>
                    <textarea name="meta_keywords" class="form-control"
                        rows="3">turismo sostenible, panamá, ecoturismo, guías turísticos, hotelería, restaurantes, artesanías</textarea>
                </div>

                <div class="form-group">
                    <label>Google Analytics ID</label>
                    <input type="text" name="ga_id" placeholder="UA-XXXXXXXXX-X" class="form-control">
                </div>
            </div>

            <!-- Botones de acción -->
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">💾 Guardar Configuración</button>
                <button type="reset" class="btn btn-outline">🔄 Restablecer</button>
                <a href="backup-config.php" class="btn btn-secondary">📥 Respaldar Configuración</a>
            </div>
        </form>

        <!-- Herramientas del Sistema -->
        <div class="system-tools">
            <h3>🛠️ Herramientas del Sistema</h3>

            <div class="tools-grid">
                <div class="tool-card">
                    <h4>🔄 Limpiar Cache</h4>
                    <p>Eliminar archivos temporales del sistema</p>
                    <button class="btn btn-outline" onclick="limpiarCache()">Ejecutar</button>
                </div>

                <div class="tool-card">
                    <h4>📊 Optimizar Base de Datos</h4>
                    <p>Optimizar tablas y mejorar rendimiento</p>
                    <button class="btn btn-outline" onclick="optimizarBD()">Ejecutar</button>
                </div>

                <div class="tool-card">
                    <h4>📁 Respaldar Sistema</h4>
                    <p>Crear respaldo completo del sistema</p>
                    <a href="backup-system.php" class="btn btn-outline">Ejecutar</a>
                </div>

                <div class="tool-card">
                    <h4>📈 Logs del Sistema</h4>
                    <p>Revisar registros y errores del sistema</p>
                    <a href="system-logs.php" class="btn btn-outline">Ver Logs</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function limpiarCache() {
    if (confirm('¿Estás seguro de limpiar el cache del sistema?')) {
        fetch('../../includes/system_tools.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    action: 'clear_cache'
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Cache limpiado correctamente');
                } else {
                    alert('Error: ' + data.message);
                }
            });
    }
}

function optimizarBD() {
    if (confirm('¿Estás seguro de optimizar la base de datos?')) {
        fetch('../../includes/system_tools.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    action: 'optimize_db'
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Base de datos optimizada correctamente');
                } else {
                    alert('Error: ' + data.message);
                }
            });
    }
}
</script>

<?php include '../../includes/footer.php'; ?>