// 2024 - 07 - 22
function toDateString(milli) {
	let d;
	if (!isNaN(milli)) {
        d = new Date(parseInt(milli));
    } else {
        // milli이 문자열 형식의 날짜일 경우
        d = new Date(milli);
    }
	let year = d.getFullYear();
	let month = make2digits(d.getMonth() + 1);
	let date = make2digits(d.getDate());
	let hour = make2digits(d.getHours());
	let minute = make2digits(d.getMinutes());
	let second = make2digits(d.getSeconds());
	
	return year + "년" + month + "월" + date + "일" + hour + "시" + minute + "분" + second + "초"; 
}


function make2digits(val) {
	return (val < 10) ? "0" + val : val;
}