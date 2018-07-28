//生徒の成績を管理し、検索することのできるスマートコントラクト
pragma solidity ^0.4.18;
contract Grades{
    
    // 学年を保存する連想配列
    mapping (bytes32 => string) public grades;
    //生徒名を保存する配列
    bytes32[] public studentList;
    
    //引数にstudentNamesを取り、studentListに割り振るコンストラクタ
    constructor(bytes32[] studentNames) public {
        studentList = studentNames;
    }
    
    //生徒に成績を割り振る
    function giveGradeToStudent(bytes32 student, string grade) public {
        require(validStudent(student));
        grades[student] = grade;
    }
    
    //生徒の存在チェック
    function validStudent(bytes32 student) view public returns (bool) {
        for(uint i = 0; i < studentList.length; i++) {
            if (studentList[i] == student) {
                return true;
                
            }
            
        }
        return false;
    }
    
    //生徒の名前を引数にして引数にして、成績を返す返す。
    function getGradeForStudent(bytes32 student) view public returns (string) {
        require(validStudent(student));
        return grades[student];
    }
}
