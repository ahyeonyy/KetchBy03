<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ketchby</title>
<link rel="stylesheet" href="./style/mypage.css" /><link rel="stylesheet" href="./style/mypage.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script>


//날짜 포맷 정규식 (yyyy-mm-dd)
const regexDate = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
// s_date에 담긴 날짜로 날짜 객체 생성
//const thisDate = regexDate.test(s_date) ? new Date(s_date) : new Date();
var ss_date = "${d.s_date}"
var s_date = new Date("${d.s_date}");
var e_date = new Date("${d.e_date}");
var ss_time = "${s_time}";
var s_time = ss_time.substring(0,3);
console.log("d.s_time : "+s_time);
var daylist = ${daylist}
console.log(daylist)
console.log(s_date)
const thisDate = new Date(ss_date);
// 오늘 날짜 (yyyy-mm-dd 00:00:00)
//const today = new Date();
// 달력이 표기하는 최대 개월 수
const limitMonth = 4;
// 달력에서 표기하는 날짜 객체
let thisMonth = thisDate;
// 달력에서 표기하는 년
let currentYear = thisMonth.getFullYear();
// 달력에서 표기하는 월
let currentMonth = thisMonth.getMonth();

// 체크인 날짜
let checkInDate = "";
// 체크아웃 날짜
let checkOutDate = "";

$(document).ready(function () {
	
	$("#btn_reservation").click(function(){
		var date = $("#check_in_day").text();
		var reserv_date = date.substring(0,10)
		console.log(reserv_date);
		window.location.href = "reservationOK.do?date="+reserv_date+"&cl_no="+${cl_no};
		alert("예약되었습니다!");
		
	})
	
    // 달력 만들기
    calendarInit(thisMonth,s_date,e_date);

    // 이전달로 이동
    $('.go-prev').on('click', function () {
        const startDate = $('.start-year-month').html().split('.');

        // 달력이 현재 년 월 보다 같거나 작을경우 뒤로가기 막기
        if (getLimitMonthCheck(parseInt(startDate[0]), parseInt(startDate[1])) <= 0) {
            return;
        }

        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        calendarInit(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function () {
        const lastDate = $('.last-year-month').html().split('.');

        // 예약 가능 최대 개월수와 같거나 크다면 다음달 이동 막기
        if (getLimitMonthCheck(parseInt(lastDate[0]), parseInt(lastDate[1])) >= limitMonth) {
            alert('최대예약 기간은 ' + limitMonth + '개월 입니다.');
            return;
        }

        let limitYear = thisDate.getFullYear();
        if (currentMonth + limitMonth >= 12) {
            limitYear = limitYear + 1
        }

        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        calendarInit(thisMonth);
    });
});

// 달력 그리기
function calendarInit(thisMonth, s_date, e_date) {

  // 렌더링을 위한 데이터 정리
  currentYear = thisMonth.getFullYear();
  currentMonth = thisMonth.getMonth();

  // 렌더링 html 요소 생성
  let start_calendar = '';
  let last_calendar = '';

  makeStartCalendar();
  makeLastCalendar();

//start_calendar
  function makeStartCalendar() {
    // 이전 달의 마지막 날 날짜와 요일 구하기
    const startDay = new Date(currentYear, currentMonth, 0);
    const prevDate = startDay.getDate();
    const prevDay = startDay.getDay();
    var weekdays = ["일", "월", "화", "수", "목", "금", "토"];
    // 이번 달의 마지막날 날짜와 요일 구하기
    const endDay = new Date(currentYear, currentMonth + 1, 0);
    const nextDate = endDay.getDate();
    const nextDay = endDay.getDay();

    // 지난달
    for (let i = prevDate - prevDay; i <= prevDate; i++) {
      start_calendar += prevDisableDay(i);
      console.log(i);
    }

 // 이번 달
    for (let i = 1; i <= nextDate; i++) {
      const currentDate = new Date(currentYear, currentMonth, i);
      if (currentDate >= s_date && currentDate <= e_date) {
        var day = currentDate.getDay(); // 해당 날짜의 요일을 가져옵니다.
        var dayOfWeek = weekdays[day]; // 요일에 해당하는 문자열을 가져옵니다.

        // 요일이 daylist에 포함되어 있는지 확인하고, 포함되어 있으면 해당 날짜를 활성화합니다.
        if (daylist.includes(day)) {
          start_calendar += enabledDay(currentYear, currentMonth, i);
        } else {
          start_calendar += disabledDay(i);
        }
      } else {
        start_calendar += disabledDay(i);
      }
    }

    // 다음달 7 일 표시
    for (let i = 1; i <= (6 - nextDay); i++) {
      start_calendar += nextDisableDay(i);
    }

    $('.start-calendar').html(start_calendar);
    // 월 표기
    $('.start-year-month').text(currentYear + '.' + zf((currentMonth + 1)));
  }


//last_calendar
  function makeLastCalendar() {
    let tempCurrentYear = currentYear;
    let tempCurrentMonth = currentMonth + 1;

    var weekdays = ["일", "월", "화", "수", "목", "금", "토"];

    if (tempCurrentMonth >= 12) {
      tempCurrentYear = parseInt(tempCurrentYear) + 1;
      tempCurrentMonth = 0;
    }

    // 이전 달의 마지막 날 날짜와 요일 구하기
    const startDay = new Date(tempCurrentYear, tempCurrentMonth, 0);
    const prevDate = startDay.getDate();
    const prevDay = startDay.getDay();

    // 이번 달의 마지막날 날짜와 요일 구하기
    const endDay = new Date(tempCurrentYear, tempCurrentMonth + 1, 0);
    const nextDate = endDay.getDate();
    const nextDay = endDay.getDay();

    // 지난달
    for (let i = prevDate - prevDay; i < prevDate; i++) {
      last_calendar += prevDisableDay(i);
    }

    // 이번 달
    for (let i = 1; i <= nextDate; i++) {
      const currentDate = new Date(tempCurrentYear, tempCurrentMonth, i);
      if (currentDate >= s_date && currentDate <= e_date) {
        var day = currentDate.getDay();
        var dayOfWeek = weekdays[day];
        if (daylist.includes(day)) {
          last_calendar += enabledDay(currentYear, currentMonth, i);
        } else {
          last_calendar += disabledDay(i);
        }
      } else {
        last_calendar += disabledDay(i);
      }
    }

    // 다음달 7 일 표시
    for (let i = 1; i <= (6 - nextDay); i++) {
      last_calendar += nextDisableDay(i);
    }

    $('.last-calendar').html(last_calendar);
    // 월 표기
    $('.last-year-month').text(tempCurrentYear + '.' + zf((tempCurrentMonth + 1)));
  }


  // 지난달 미리 보기
function prevDisableDay(day) {
  return '<div class="day prev-month disable">' + day + '</div>';
}


  // 이번달 (활성화)
  function enabledDay(currentYear, currentMonth, day) {
    const date = currentYear + '' + zf((currentMonth + 1)) + '' + zf(day);

    if (checkInDate === date) {
      return '<div class="day current checkIn" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
    } else {
      return '<div class="day current" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
    }
  }

  // 이번달 (비활성화)
  function disabledDay(day) {
    return '<div class="day current disable">' + day + '</div>';
  }

  // 다음달 미리 보기
  function nextDisableDay(day) {
    return '<div class="day next disable">' + day + '</div>';
  }
}


//달력 날짜 클릭
function selectDay(obj) {
    if (checkInDate === "") {
        $(obj).addClass('checkIn');
        $('.checkIn').find('.check_in_out_p').html('선택일');
        checkInDate = $(obj).data('day');
        $('#check_in_day').html(getCheckIndateHtml());
    } else {
        // 선택 날짜를 한 번 더 클릭했을 때 체크인 날짜 변경
        if (parseInt(checkInDate) === $(obj).data('day')) {
            // 선택한 날짜 초기화
            $(obj).removeClass('checkIn');
            $('.checkIn').find('.check_in_out_p').html('');
            checkInDate = "";
            $('#check_in_day').html("");
            return;
        }

        // 선택한 날짜 변경
        $('.checkIn').find('.check_in_out_p').html('');
        $('.day').removeClass('checkIn');
        $(obj).addClass('checkIn');
        $('.checkIn').find('.check_in_out_p').html('선택일');
        checkInDate = $(obj).data('day');
        $('#check_in_day').html(getCheckIndateHtml());
    }
}

// 선택한  날짜 표기
function getCheckIndateHtml() {
    checkInDate = checkInDate.toString();
    
    return checkInDate.substring(0, 4) + "-" + checkInDate.substring(4, 6) + "-" + checkInDate.substring(6, 8) + " ( " + strWeekDay(weekday(checkInDate)) + " )" 
    +"<br>${s_time} ~ ${e_time}";
}



// 체크아웃 날짜 표기


// 체크인 날짜 클릭시 예약 가능한 마지막 날인지 체크 마지막날 일경우 체크아웃 날짜 자동 선택


// 최대 개월수 체크
function getLimitMonthCheck(year, month) {
    let months = ((thisDate.getFullYear() - year) * 12);
    months -= (thisDate.getMonth() + 1);
    months += month;

    return months;
}

// 날짜형태 변환
function conversion_date(YYMMDD, choice) {
    const yyyy = YYMMDD.substring(0, 4);
    const mm = YYMMDD.substring(4, 6);
    const dd = YYMMDD.substring(6, 8);

    return (choice === 1)
        ? yyyy + "-" + zf(mm) + "-" + zf(dd)
        : yyyy + "." + zf(mm) + "." + zf(dd);
}

// 몇요일인지 알려주는 함수 (숫자 형태)
function weekday(YYYYMMDD) {
    const weekday_year = YYYYMMDD.substring(0, 4);
    const weekday_menth = YYYYMMDD.substring(4, 6);
    const weekday_day = YYYYMMDD.substring(6, 9);

    return new Date(weekday_year + "-" + weekday_menth + "-" + weekday_day).getDay();
}

// 요일 리턴
function strWeekDay(weekday) {
    switch (weekday) {
        case 0: return "일"
            break;
        case 1: return "월"
            break;
        case 2: return "화"
            break;
        case 3: return "수"
            break;
        case 4: return "목"
            break;
        case 5: return "금"
            break;
        case 6: return "토"
            break;
    }
}

// 숫자 두자리로 만들기
function zf(num) {
    num = Number(num).toString();

    if (Number(num) < 10 && num.length == 1) {
        num = "0" + num;
    }

    return num;
}


</script>

<link href="style/calendar.css" rel="stylesheet" />

</head>

<body>

	<header>
		<jsp:include page="divheader.jsp" />
	</header>

  <div class="calendar-wrap">
    <div class="calendar-middle-wrap">
      <div class="cal_nav">
        <a href="javascript:;" class="nav-btn go-prev"></a>
        <span class="year-month start-year-month"></span>
        <a href="javascript:;" class="nav-btn go-next"></a>
      </div>
      <div class="cal_wrap">
        <div class="days">
          <div class="day">일</div>
          <div class="day">월</div>
          <div class="day">화</div>
          <div class="day">수</div>
          <div class="day">목</div>
          <div class="day">금</div>
          <div class="day">토</div>
        </div>
        <div class="dates start-calendar"></div>
      </div>
    </div>

    <div class="calendar-middle-wrap">
      <div class="cal_nav">
        <a href="javascript:;" class="nav-btn go-prev"></a>
        <span class="year-month last-year-month"></span>
        <a href="javascript:;" class="nav-btn go-next"></a>
      </div>
      <div class="cal_wrap">
        <div class="days">
          <div class="day">일</div>
          <div class="day">월</div>
          <div class="day">화</div>
          <div class="day">수</div>
          <div class="day">목</div>
          <div class="day">금</div>
          <div class="day">토</div>
        </div>
        <div class="dates last-calendar"></div>
      </div>
    </div>

    <div class="checkInOutInfo">
      <div>
        <p>
          <span>선택일</span>
          <label id="check_in_day"></label>
        </p>
       <button id = "btn_reservation" class="my-page-item-button2" > <span class="my-page-text41" style="top: 7px; left: 7px;">예약하기</span> </button>
      </div>
    </div>
  </div>
</body>
</html>