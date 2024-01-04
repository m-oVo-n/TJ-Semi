key = 'k/xEwMLDOS/d1IkvIdY4BA';
// 처음 넘어왔을 떄 onload 여부 확인하는 함수
function initSearch() {
    const dPValue = document.getElementById("dP").value;
    const aPValue = document.getElementById("aP").value;
    const dTValue = document.getElementById("dT").value;

    if (dPValue != "" && aPValue != "" && dTValue != "") {
        search();
    }
}
// 교통정보 다음페이지로 넘기기
function send(transInfo) {
	let url = "detail.jsp?";
	url += 0 + "=" + transInfo[0];
	for(i=1; i<transInfo.length; i++) {
		url += "&" + i + "=" + transInfo[i];
	}
	location.href=url;
}

// 좌표값 찾는 함수
function geocode(address) {
    return new Promise((resolve, reject) => {
        const geocoder = new kakao.maps.services.Geocoder();
        
        geocoder.addressSearch(address, (result, status) => {
            if (status === kakao.maps.services.Status.OK) {
                resolve({ x: result[0].x, y: result[0].y });
            } else {
                const places = new kakao.maps.services.Places();
                
                places.keywordSearch(address, (result, status) => {
                    if (status === kakao.maps.services.Status.OK) {
                        resolve({ x: result[0].x, y: result[0].y });
                    } else {
                        reject();
                    }
                });
            }
        });
    });
}


// onclick 하면 실행되는 함수 search
async function search() {
	if(document.getElementById('dT').value == "") {
		alert("가는날을 정해주세요!");
		return;
	}
	document.getElementById("busInfo").replaceChildren(); // 초기화
	document.getElementById("trainInfo").replaceChildren(); // 초기화
	document.getElementById("airplaneInfo").replaceChildren(); // 초기화
	
    const startAddress = document.getElementById("dP").value;
    const endAddress = document.getElementById("aP").value;

    try {
        const startResult = await geocode(startAddress);
        const endResult = await geocode(endAddress);

        // 출발 도착 좌표값 저장
        const sx = startResult.x;
        const sy = startResult.y;
        const ex = endResult.x;
        const ey = endResult.y;
        
        // 지도 가져오기
         mapMarker(sx,sy,ex,ey);
        // 리스트 불러오기
        searchTList(startResult, endResult);
        
    } catch (error) { // 좌표값 없을 때
        alert("주소를 다시 입력해주세요!");
    }
}

// api 연결하고 station(운행정보) 가져오기
async function fetchAndGetStation(url) {
	const response = await fetch(url)
	const data = await response.json();
	return data.result.station;
}

// 버스 도착시간 구하는 함수
function getBusArrivalTime(dT, tT) {
	const departT = dT.split(":");
	const totalT = tT.split(":");
	let hour = 0;
	let minute = 0;
	
	if(parseInt(departT[1]) + parseInt(totalT[1]) >= 60) { // 분 더해서 60 이상이면 시간 +1
		minute = parseInt(departT[1]) + parseInt(totalT[1]) - 60;
		hour += 1;
	} else {
		minute = parseInt(departT[1]) + parseInt(totalT[1]);
	}
	
	if(hour + parseInt(departT[0]) + parseInt(totalT[0]) >= 24) { // 시간 더해서 24 이상이면 0시부터 시작
		hour = hour + parseInt(departT[0]) + parseInt(totalT[0]) - 24;
	} else {
		hour = hour + parseInt(departT[0]) + parseInt(totalT[0]);
	}
	
	hour = hour < 10 ? "0" + hour : hour;
	minute = minute < 10 ? "0" + minute : minute;
	
	return hour + ":" + minute;
}

//자식 리스트 태그 생성, 부모 태그에 붙이는 함수
function createLi (value, parentTag, transInfo, name, transInfo2) {
	let inputTag = document.createElement('input');
	inputTag.setAttribute("type", "hidden");
	inputTag.setAttribute("name", value); // 넘어갈 input 만들기
	if(transInfo.includes(" 원")) {
		transInfos = transInfo.split(" ");
		tI = transInfos[0];
	} else {
		tI = transInfo;
	}
	inputTag.setAttribute("value", tI);
	
	let liTag = document.createElement('li'); // 자식 li 태그 생성
    liTag.setAttribute('class', value);
    if(name != "" && transInfo2 !="") {
    	liTag.innerHTML = inputTag.outerHTML + transInfo + "<br><input type='hidden' name='"+name+"' value="+transInfo2+"><span>"+transInfo2+"</span>";
    } else {
    	liTag.innerHTML = inputTag.outerHTML + transInfo;
    }
    parentTag.appendChild(liTag);
    
    return parentTag;
}
//자식 리스트 태그 생성, 부모 태그에 붙이는 함수
function createUl (value, parentTag, transInfo, name, transInfo2) {
	let inputTag = document.createElement('input');
	inputTag.setAttribute("name", value);
	inputTag.setAttribute("type", "hidden"); // 넘어갈 input 만들기
	inputTag.value = transInfo;
	
	let ulTag = document.createElement('ul'); // 자식 ul 태그 생성
    ulTag.setAttribute('class', value);
	ulTag.innerHTML = inputTag.outerHTML + transInfo + "<br><input type='hidden' name='"+name+"' value="+transInfo2+"><span>"+transInfo2+"</span>";
    parentTag.appendChild(ulTag);
    
    return parentTag;
}
// 도착 날짜 계산 함수
function getArrDate(dT, tT) {
	const departT = dT.split(":");
	const totalT = tT.split(":");
	let hour = 0;
	let minute = 0;
	
	if(parseInt(departT[1]) + parseInt(totalT[1]) >= 60) { // 분 더해서 60 이상이면 시간 +1
		minute = parseInt(departT[1]) + parseInt(totalT[1]) - 60;
		hour += 1;
	} else {
		minute = parseInt(departT[1]) + parseInt(totalT[1]);
	}
	// input 태그에서 날짜 값을 가져오기
    const dateInput = document.getElementById("dT").value;
    const selectedDate = new Date(dateInput);
    const nextDay = new Date(selectedDate);
    
	if(hour + parseInt(departT[0]) + parseInt(totalT[0]) >= 24) { // 시간 더해서 24 이상이면 날짜 +1
        // 1일을 더한 날짜 계산
        nextDay.setDate(selectedDate.getDate() + 1);
	}
	
	return nextDay.toISOString().split('T')[0];
}

// 교통 정보 버튼 생성 함수
function createTransInfo(transInfo) {
	let parentUlTag = document.createElement('ul');
    parentUlTag.setAttribute("class", "resultInfo"); // ul 부모태그 만들기
	
	let formTag = document.createElement('form'); // from 생성
	formTag.setAttribute("action", "selectTicket.p");
	formTag.setAttribute("method", "post");
	let aD = getArrDate(transInfo[0], transInfo[2]);
	formTag.innerHTML = "<input type='hidden' name='spP' value="+transInfo[13]+"><input type='hidden' name='dD' value="+document.getElementById('dT').value+"><input type='hidden' name='quantity' value="+document.getElementById('quantity').value+"><input type='hidden' name='aD' value="+aD+">";
	
	formTag.onmouseover = function () {
    	mapMarker(transInfo[9],transInfo[10],transInfo[11],transInfo[12]);	
	}
    
	formTag.onclick = function() {
		formTag.submit();
	};
	
	let time = document.createElement('li');
	time.setAttribute('class','time');
	let timeLi = document.createElement('ul');
	timeLi.setAttribute('class', 'timeList');
	createUl('transType', time, transInfo[3]+" "+transInfo[7], "transNo", transInfo[8]);
	
	createLi('deTime', timeLi, transInfo[0], "deP", transInfo[4]);
	
	createLi('toTime', timeLi, "--- " + transInfo[2] + " ---", "", "");
	
	createLi('arrTime', timeLi, transInfo[1], "arrP", transInfo[5]);
	createLi('price', timeLi, transInfo[6]+" 원", "count", "1명&bull;편도");
	
	time.appendChild(timeLi);
	parentUlTag.appendChild(time);
	
	formTag.appendChild(parentUlTag);
	
	return formTag;
}

// 시외버스 총 시간 찾는 함수
function totalTime(wasteTime) {
	const totalHour = Math.floor(wasteTime / 60);
    const totalMinute = wasteTime % 60;
    return `${totalHour < 10 ? '0' : ''}${totalHour}:${totalMinute < 10 ? '0' : ''}${totalMinute}`;
}
// 고속버스 총 시간 00:00 형태로 바꾸는 함수 
function exTotalTime(wastetime) {
	const [hours, minutes] = wastetime.split(':');
    return `${parseInt(hours) < 10 ? '0' : ''}${hours}:${minutes}`;
}

// 고속버스 세팅함수
function busSet (include, station, schedule, type) {
	// 우등이 포함되었는지 확인
	const dT = include == 0 ? schedule : schedule.replace(`(${include})`, '');
	
	// 종류에 따라 가격 세팅
	switch(type) {
	case "고속일반" :
	case "시외일반" : p = station.normalFare; break;
	case "고속우등" : p = station.specialFare; break;
	case "고속야간일반" : 
	case "시외야간" : p = station.nightFare; break;
	case "고속야간우등" : p = station.nightSpecialFare; break;
	}
	
	// 시외,고속에 따라 총 시간 계산 함수 다름
	const tT = type.includes('시외') ? totalTime(station.wasteTime) : exTotalTime(station.wasteTime);
	const aT = getBusArrivalTime(dT, tT);
	const t = type;
	const busInfo = [dT, aT, tT, "<i class='fa-solid fa-bus'></i>", fS, lS, p, t, ".", sX, sY, eX, eY, "0"];
	const parentUlTag = createTransInfo(busInfo);
	document.getElementById("busInfo").appendChild(parentUlTag);
}

// 리스트 찾는 함수
	async function searchTList(startResult, endResult) {
		const sx = startResult.x;
	    const sy = startResult.y;
	    const ex = endResult.x;
	    const ey = endResult.y;
	    
        try {
            const response = await fetch("https://api.odsay.com/v1/api/searchPubTransPathT?SX=" + sx + "&SY=" + sy + "&EX=" + ex + "&EY=" + ey + "&SearchType=1&apiKey="+key);
            const data = await response.json();
            const path = data.result.path;
            var visitedTPairs = new Set(); // 이미 있는 경로인지 확인하기 위해
            for (let i = 0; i < path.length; i++) { // 가는 경로 수 만큼 반복한다
                fS = path[i].info.firstStartStation; // 출발역
                lS = path[i].info.lastEndStation; // 도착역
                sI = path[i].subPath[0].startID; // 출발역ID
                eI = path[i].subPath[0].endID; // 도착역ID
                sX = path[i].subPath[0].startX; // 출발역 x좌표
                sY = path[i].subPath[0].startY;
                eX = path[i].subPath[0].endX;
                eY = path[i].subPath[0].endY;

                if (path[i].pathType == 11) { // 경로 타입이 열차라면

                    if (!visitedTPairs.has(`${sI}-${eI}`)) { // 이전에 담은 출발-도착ID랑 겹치는 지 확인
                        visitedTPairs.add(`${sI}-${eI}`)
                    } else { continue; };
                    const stations = await fetchAndGetStation("https://api.odsay.com/v1/api/trainServiceTime?lang=0&startStationID=" + sI + "&endStationID=" + eI + "&apiKey="+key);
                    stations.forEach(station => {
                        if (station.runDay == "매일") {
                            dT = station.departureTime; // 출발시간
                            aT = station.arrivalTime; // 도착시간
                            tT = station.wasteTime; // 총시간
                            gP = station.fare.general; // 일반가격
                            spP = 0;
                            if(station.trainClass.includes("KTX")) {
                            	spP = station.fare.special; // 우등가격
                            }
                            stP = station.fare.standing; // 입석가격
                            tN = station.trainNo; // 편명
                            tC = station.trainClass; // 차 종류
                            trainInfo = [dT, aT, tT, "<i class='fa-solid fa-train'></i>", fS, lS, gP, tC, tN, sX, sY, eX, eY, spP];
                           
                            parentUlTag = createTransInfo(trainInfo);
                            document.getElementById("trainInfo").appendChild(parentUlTag);
                        }
                    })
                }

                else if(path[i].pathType == 12) {
    				if(path[i].subPath[0].trafficType == 5){ // 고속버스 타입이라면
    					const stations = await fetchAndGetStation("https://api.odsay.com/v1/api/expressServiceTime?lang=0&startStationID="+sI+"&endStationID="+eI+"&apiKey="+key);
    					stations.forEach(station => {
    						if(station.shedule != "") {
    							const schedules = station.schedule.replaceAll("\n", "/").split("/");
    							schedules.forEach(schedule => {
    								if(schedule.includes("(우등)")) {
    									busSet("우등", station, schedule, "고속우등");
    								} else {
    									busSet(0, station, schedule, "고속일반");
    								}
    							});
    						};
    						if(station.nightSchedule != "") {
    							const nightSchedules = station.nightSchedule.replaceAll("\n", "/").split("/");
    							nightSchedules.forEach(nightSchedule => {
    								if(nightSchedule.includes("(우등)")) {
    									busSet("우등", station, nightSchedule, "고속야간우등");
    								} else {
    									busSet(0, station, nightSchedule, "고속야간일반");
    								}
    							});
    						}		
    					})
    				}
    				else if(path[i].subPath[0].trafficType == 6) { // 시외버스 타입이라면
    					
    					const stations = await fetchAndGetStation("https://api.odsay.com/v1/api/intercityServiceTime?lang=0&startStationID="+sI+"&endStationID="+eI+"&apiKey="+key);
    					stations.forEach(station => {
    						if(station.shedule != "") {
    							const schedules = station.schedule.replaceAll("\n", "/").split("/");
    							schedules.forEach(schedule => {
    								busSet(0, station, schedule, "시외일반");
    							});
    						}
    						if(station.nightSchedule != "") {
    							const nightSchedules = station.nightSchedule.replaceAll("\n", "/").split("/");
    							nightSchedules.forEach(nightSchedule => {
    								busSet(0, station, nightSchedule, "시외야간");
    							});
    						}
    					});
    				}
    			}
    			
    			else if(path[i].pathType == 13) { // 경로 타입이 항공이라면
    				const tT = totalTime(path[i].info.totalTime) // 총시간
    				const p = path[i].info.totalPayment; // 일반가격
    				const stations = await fetchAndGetStation("https://api.odsay.com/v1/api/airServiceTime?lang=0&startStationID="+sI+"&endStationID="+eI+"&apiKey="+key);
    				stations.forEach(station => {
    					if(station.runDay == "매일") {
    						const dT = station.departureTime // 출발시간
    						const aT = station.arrivalTime // 도착시간
    						const al = station.airline // 항공사
    						const f = station.flight // 비행기번호
    						const airplaneInfo = [dT, aT, tT, "<i class='fa-solid fa-plane'></i>", fS, lS, p, al, f, sX, sY, eX, eY,"0"];
    						const parentUlTag = createTransInfo(airplaneInfo);
                            document.getElementById("airplaneInfo").appendChild(parentUlTag);
    					}
    				})
    			}
    		}
        } catch (error) {
            alert("검색 결과가 없습니다.");
        }
    }
function show(type) {
	showReset();
	document.getElementById(type+"Info").style.display = 'block';
}
function showReset() {
	document.getElementById("airplaneInfo").style.display = 'none';
	document.getElementById("busInfo").style.display = 'none';
	document.getElementById("trainInfo").style.display = 'none';
}