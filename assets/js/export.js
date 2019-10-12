let tableToExcel = (function() {
    let uri = 'data:application/vnd.ms-excel;base64,',
        template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>',
        base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
        format = function(s, c) {
            return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; })
        },
        downloadURI = function(uri, name) {
            let link = document.createElement("a");
            link.download = name;
            link.href = uri;
            link.click();
        };

    return function(table, name, fileName) {
        if (!table.nodeType) table = document.getElementById(table);
        let ctx = { worksheet: name || 'Worksheet', table: table.innerHTML };
        let resUri = uri + base64(format(template, ctx));
        downloadURI(resUri, fileName);
    }
})();
let table_name = document.getElementById('report_name').innerText;
document.getElementById('export').onclick = function() { tableToExcel('table', table_name, table_name + '.xls') };
