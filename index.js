import express from "express";
import pg from "pg";
import 'dotenv/config';

const app = express();
const port = 3000;

const db = new pg.Pool({
    user: process.env.DB_USER,
    password: String(process.env.DB_PASSWORD),
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    database: process.env.DB_NAME 
});

// Configurar EJS
app.set("view engine", "ejs");

// Middlewares para formularios y archivos estaticos (CSS/Imagenes)
app.use(express.urlencoded({ extended: true }));
app.use(express.static("public"));

app.get('/', async (req, res) => {
    // Leemos si en la URL viene el parámetro "exito"
    const reservaExitosa = req.query.exito === 'true';

    try {
        const {rows} = await db.query('SELECT * from hotel');
        
        // Le mandamos a index.ejs la lista de hoteles Y la variable de éxito
        res.render('index', { 
            hoteles: rows, 
            exito: reservaExitosa 
        });

    } catch (error) {
        console.error(error);
        res.status(500).send("Error al obtener datos");
    }
});

app.get('/hotel/:id', async (req, res) => {
    const id = req.params.id;
    console.log("Id del hotel solicitado:", id);

    try {
        const resultado = await db.query(`
            SELECT 
                h.id_habitacion, 
                h.piso_habitacion,
                h.num_habitacion,
                th.nombre_tipo_habitacion, 
                th.precio_tipo_habitacion 
            FROM habitacion h
            INNER JOIN  tipo_habitacion th
                ON h.tipo_habitacion_id = th.id_tipo_habitacion
            WHERE h.hotel_id = $1
        `, [id]);

        console.log(resultado.rows);

        // Envia los datos a habitaciones.ejs
        res.render('habitaciones',{ habitaciones: resultado.rows});

    } catch (error) {
        console.error(error);
        res.status(500).send("Error al obtener datos");
    }
});

app.get('/reservar/:id', async (req, res) => {
    const id = req.params.id;
    console.log("Id del hotel solicitado:", id);

    try {
        const resultado = await db.query(`
            SELECT 
                h.id_habitacion, 
                h.piso_habitacion,
                h.num_habitacion,
                th.nombre_tipo_habitacion, 
                th.precio_tipo_habitacion 
            FROM habitacion h
            INNER JOIN  tipo_habitacion th
                ON h.tipo_habitacion_id = th.id_tipo_habitacion
            WHERE h.id_habitacion = $1
        `, [id]);

        const habitacion = resultado.rows[0];

        res.render('reserva', { habitacion: habitacion });

    } catch (error) {
        console.error(error);
        res.status(500).send("Error al obtener datos");
    }
});

app.post('/reservar', async (req, res) => {
    console.log("Datos recibidos del formulario:", req.body);
    
    const {
        tipo_reserva,
        nom_reserva,
        nom_huesped,
        dir_reserva,
        tel_reserva,
        fecha_inicio_reserva,
        fecha_fin_reserva,
        id_habitacion_reserva,
        precio_reserva
    } = req.body;

    // LÓGICA DE NEGOCIO: Unificar el nombre del cliente
    // Si es agencia, guardamos el nombre del huésped y entre paréntesis la agencia
    let nombreFinal = nom_reserva;
    if (tipo_reserva === 'Agencia' && nom_huesped) {
        nombreFinal = `${nom_huesped} (Agencia: ${nom_reserva})`;
    }

    try {
        await db.query(`
            INSERT INTO reserva 
            (id_habitacion_reserva, tipo_reserva, nom_cliente_reserva, dir_reserva, tel_reserva, fecha_inicio_reserva, fecha_fin_reserva, precio_reserva)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8);
        `, [
            id_habitacion_reserva,
            tipo_reserva,
            nombreFinal, // Usamos nuestra variable procesada
            dir_reserva,
            tel_reserva,
            fecha_inicio_reserva,
            fecha_fin_reserva,
            precio_reserva
        ]);

        console.log("Reserva guardada exitosamente en la BD");
        
        // Respondemos al navegador enviándolo a la página principal
        res.redirect('/?exito=true');

    } catch (error) {
        console.error("Error al guardar en BD:", error);
        res.status(500).send("Hubo un error al procesar tu reserva. Revisa la consola.");
    }
});

app.listen(port, () => {
  console.log(`Listening on port ${port}`)
});