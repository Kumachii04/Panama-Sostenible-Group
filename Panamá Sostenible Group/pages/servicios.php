<?php
$pageTitle = "Servicios Sostenibles";
include '../includes/header.php';
include '../includes/database.php';
include '../includes/functions.php';

$database = new Database();
$conn = $database->getConnection();

// Obtener parámetros de búsqueda
$search = $_GET['search'] ?? '';
$categoriaId = $_GET['categoria'] ?? '';
$precioMin = $_GET['precio_min'] ?? '';
$precioMax = $_GET['precio_max'] ?? '';
$ubicacion = $_GET['ubicacion'] ?? '';
$sostenible = isset($_GET['sostenible']);

// Obtener servicios filtrados
$servicios = getServiciosFiltrados($conn, [
    'search' => $search,
    'categoria_id' => $categoriaId,
    'precio_min' => $precioMin,
    'precio_max' => $precioMax,
    'ubicacion' => $ubicacion,
    'sostenible' => $sostenible
]);

$categorias = getCategorias($conn);
?>

<div class="page-header">
    <div class="container">
        <h1>Servicios Sostenibles</h1>
        <p>Descubre experiencias auténticas y responsables en Panamá</p>
    </div>
</div>

<div class="container">
    <div class="services-page">
        <!-- Filtros -->
        <aside class="filters-sidebar">
            <div class="filter-group">
                <h3>Filtros</h3>

                <!-- Búsqueda -->
                <div class="filter-item">
                    <label>Buscar</label>
                    <input type="text" id="searchInput" value="<?= htmlspecialchars($search) ?>"
                        placeholder="¿Qué servicio buscas?">
                </div>

                <!-- Categoría -->
                <div class="filter-item">
                    <label>Categoría</label>
                    <select id="categoriaFilter">
                        <option value="">Todas las categorías</option>
                        <?php foreach($categorias as $cat): ?>
                        <option value="<?= $cat['id'] ?>" <?= $categoriaId == $cat['id'] ? 'selected' : '' ?>>
                            <?= $cat['nombre'] ?>
                        </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <!-- Precio -->
                <div class="filter-item">
                    <label>Rango de Precio</label>
                    <div class="price-range">
                        <input type="number" id="precioMin" placeholder="Mín" value="<?= $precioMin ?>">
                        <span>-</span>
                        <input type="number" id="precioMax" placeholder="Máx" value="<?= $precioMax ?>">
                    </div>
                </div>

                <!-- Ubicación -->
                <div class="filter-item">
                    <label>Ubicación</label>
                    <input type="text" id="ubicacionFilter" value="<?= htmlspecialchars($ubicacion) ?>"
                        placeholder="Ciudad o región">
                </div>

                <!-- Sostenible -->
                <div class="filter-item">
                    <label class="checkbox-label">
                        <input type="checkbox" id="sostenibleFilter" <?= $sostenible ? 'checked' : '' ?>>
                        Solo servicios sostenibles
                    </label>
                </div>

                <button class="btn btn-primary" onclick="applyFilters()">Aplicar Filtros</button>
            </div>
        </aside>

        <!-- Resultados -->
        <main class="services-results">
            <div class="results-header">
                <h2><?= count($servicios) ?> servicios encontrados</h2>
                <div class="sort-options">
                    <select id="sortSelect">
                        <option value="recientes">Más recientes</option>
                        <option value="precio_asc">Precio: Menor a Mayor</option>
                        <option value="precio_desc">Precio: Mayor a Menor</option>
                        <option value="rating">Mejor valorados</option>
                    </select>
                </div>
            </div>

            <div class="services-grid" id="resultsContainer">
                <?php if(empty($servicios)): ?>
                <div class="no-results">
                    <h3>No se encontraron servicios</h3>
                    <p>Intenta ajustar tus filtros de búsqueda</p>
                </div>
                <?php else: ?>
                <?php foreach($servicios as $servicio): ?>
                <div class="service-card">
                    <div class="service-image">
                        <img src="<?= json_decode($servicio['imagenes'])[0] ?>" alt="<?= $servicio['titulo'] ?>">
                        <?php if($servicio['sostenible']): ?>
                        <span class="badge-sostenible">♻️ Sostenible</span>
                        <?php endif; ?>
                    </div>
                    <div class="service-info">
                        <h3><?= $servicio['titulo'] ?></h3>
                        <p class="provider"><?= $servicio['nombre_empresa'] ?></p>
                        <p class="location">📍 <?= $servicio['ubicacion'] ?></p>
                        <div class="rating">⭐
                            <?= $servicio['rating'] ? number_format($servicio['rating'], 1) : 'Nuevo' ?></div>
                        <p class="description"><?= substr($servicio['descripcion'], 0, 100) ?>...</p>
                        <div class="service-meta">
                            <span class="price">$<?= $servicio['precio'] ?> / <?= $servicio['tipo_precio'] ?></span>
                            <a href="servicio-detalle.php?id=<?= $servicio['id'] ?>" class="btn btn-primary">Ver
                                Detalles</a>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
                <?php endif; ?>
            </div>
        </main>
    </div>
</div>

<?php include '../includes/footer.php'; ?>