export const fetchAllDrops = () => {
    // debugger
    return $.ajax({
        method: "GET",
        url: "/api/drops"
    })
}

export const createDrop = (drop) => {
    // debugger
    return $.ajax({
        method: "POST",
        url: "/api/drops",
        data: { drop: drop }
    })
}

export const fetchDrop = (dropId) => {
    return $.ajax({
        method: "GET",
        url: `/api/drops/${dropId}`
    });
};