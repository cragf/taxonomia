let filaActual = null;
let sortDirection = {};
function Toggle(fila) {

    if (filaActual !== null) {
        const index = Array.from(fila.parentNode.children).indexOf(filaActual);

        if (index % 2 === 0) {
            filaActual.style.backgroundColor = '#f5f5dc';
        } else {
            filaActual.style.backgroundColor = 'antiquewhite';
        }
    }

    //reseteo de las filas
    if (filaActual === fila) {
        document.querySelectorAll('.ubicacion-img').forEach(img => {
            img.style.display = 'none'; // Mostrar todas
        });
        document.querySelectorAll('.dieta-img').forEach(img => {
            img.style.display = 'none'; // Mostrar todas
        });
        filaActual = null;
        return;
    }
    //ocultacion
    document.querySelectorAll('.ubicacion-img').forEach(img => {
        img.style.display = 'none'
    });
    document.querySelectorAll('.dieta-img').forEach(img => {
        img.style.display = 'none';
    });

    //confirmacion en e4l log de la pagina
    const ubicaciones = fila.getAttribute('data-ubicaciones');
    const dieta = fila.getAttribute('data-dieta');
    console.log('Ubicaciones:', ubicaciones);
    console.log('Dieta:', dieta);

    if (ubicaciones) {
        //confirmacion en e4l log de la pagina
        const ids = ubicaciones.split(',');
        console.log('IDs:', ids);
        console.log(dieta);
        //color
        ids.forEach(id => {
            const im = document.getElementById(id.trim());
            console.log('Buscando:', id.trim(), 'Encontrado:', im);  // ← ANTES del if
            
            if (im) {
                im.style.display = 'block';
            }
        });
        
        const di = document.getElementById(dieta);
        if (di) {
            di.style.display = 'block';
        }
        console.log('Buscando:', dieta, 'Encontrado:', di);
    }

    fila.style.backgroundColor = '#ff9f70';
    filaActual = fila;
}
function Sort(columnIndex) {
    const table = document.querySelector('table');
    const tbody = document.querySelector('tbody');
    const thead = table.querySelector('thead');
    const rows = Array.from(tbody.querySelectorAll('tr'));

    sortDirection[columnIndex] = !sortDirection[columnIndex];

    console.log(rows);

    rows.sort((a,b) => {
        const at = a.cells[columnIndex].textContent.trim();
        const bt = b.cells[columnIndex].textContent.trim();
        
        if (at === '-' && bt !== '-') return 1;
        if (bt === '-' && at !== '-') return -1; 
        if (at === '-' && bt === '-') return 0;

        const comp = at.localeCompare(bt);
        return sortDirection[columnIndex] ? comp : -comp;
    });

    rows.forEach(row => tbody.appendChild(row));
    rows.forEach(row => console.log(row));

    // Actualizar los headers
    const headers = thead.querySelectorAll('th');
    headers.forEach((th, index) => {
        if (index === columnIndex) {
            const arrow = sortDirection[columnIndex] ? ' ▼' : ' ▲';
            // Remover flechas anteriores y agregar nueva
            th.textContent = th.textContent.replace(/\s*[▼▲]\s*$/, '') + arrow;
        } else {
            // Remover flecha de otras columnas
            th.textContent = th.textContent.replace(/\s*[▼▲]\s*$/, '');
        }
    });
}