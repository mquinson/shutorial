/**
 * Mainly use to separate data in localStorage.
 * If in the future many sections are present in one page this function
 * make sure that the saving/loading of data still works
 * @returns the section name of the currently loaded page
 */
function get_section(){
    let url = window.location.href
    let section = url.substring(url.lastIndexOf("/") + 1, url.lastIndexOf("."));
    return section;
}

function checkQuestion() {
    localStorage[get_section()+"_checked"] = "true";     
    resetQuestions(true);
    var questions = $('li.question-row');
    var total_questions = questions.length;
    var correct = 0;

    questions.each(function(i, el) {
        var self = $(this);
        // Single Question.
        if (self.hasClass('radio-list')) {
            if (self.find('input[type="radio"][data-content="1"]:checked').length == 1) {
                correct += 1;
            } else {
                self.addClass('text-danger');
            }
        }
        // Textbox Question.
        if(self.hasClass('textbox')) {
            var textbox = self.find('input[type="text"]');
            var correct_text = String(textbox.data("content")).trim().split("").reverse().join("");
            if(String(textbox.val()).trim().toLowerCase()==correct_text.toLowerCase()) {
                correct += 1;
            } else {
                self.addClass('text-danger');
                textbox.parent().find("i.text-correct").html(correct_text);
            }
        }
        // Multiple selection Questions.
        if(self.hasClass('checklist')) {
            var total_corrects = self.find('input[type="checkbox"][data-content="1"]').length;
            var total_incorrects = self.find('input[type="checkbox"][data-content="0"]').length;
            var correct_selected = self.find('input[type="checkbox"][data-content="1"]:checked').length;
            var incorrect_selected = self.find('input[type="checkbox"][data-content="0"]:checked').length;
            var qc = +((correct_selected / total_corrects) - (incorrect_selected/total_incorrects)).toFixed(2);
            if (qc < 0) {
                qc = 0;
            }
            correct += qc;
            if (qc == 0) {
                self.addClass('text-danger');
            } else if (qc > 0 && qc < 1) {
                self.addClass('text-warning');
            }
        }
    });
    save_data()
    showScore(correct, total_questions);
}

function showScore(correct, total) {
    var score = (correct / total).toFixed(2) * 100;
    var msgClass = 'alert-danger';
    if (score >= 99) {
        msgClass = 'alert-success';
    $('#tg-feedback').addClass(msgClass).show();
    } else if (score >= 50) {
        msgClass = 'alert-warning';
    }
    $('#tg-correct-questions').text(correct + ' out of ' + total);
    $('#tg-score').text(score);
    $('#tg-msg').addClass(msgClass).show();
}
function resetQuestions(keep) {

    $('li.question-row').removeClass('text-danger').removeClass('text-warning');
    $('i.text-correct').html('');
    $('#tg-msg').removeClass('alert-danger').removeClass('alert-success').removeClass('alert-warning').hide();
    if(keep === true) {
        return;
    }
    $('li.question-row').find('input[type="text"]').val('');
    $("input[type=radio]").prop('checked', false);
    $("input[type=checkbox]").prop('checked', false);
    //save_data()
}

$(function(){
    $('ul.radio-list,ul.checklist,ul.textbox').each(function(i, el){
        var questionClass = $(this).attr('class');
        $(this).parent().addClass('question-row').addClass(questionClass);
        if (questionClass=='radio-list') {
            $(this).find('input[type="radio"]').attr('name', 'radio-question-' + i);
        }
    });
    $('#check-questions').on('click', checkQuestion);
    $('#reset-questions').on('click', function () {
        resetQuestions(false);
        save_data();
    });

    // Assign an id to each field to easily be able to save data on them
    $('*').each(function (index) {$(this).attr("unique_id", index)});
    restore_data();
    if(localStorage[get_section()+"_checked"] === "true") checkQuestion();
    addEventListener("unload", () => save_data());
});

/**
 * When called this function copy input fields to the localstorage
 */
function save_data(){
    let section = get_section();
    var questions = $('li.question-row');

    var data = {}

    questions.each(function(i, el) {
        var self = $(this);

        // Single Question.
        if (self.hasClass('radio-list')) {
            self.find('input[type="radio"]').each(function() {
                var s = $(this);
                data[s.attr("unique_id")] = s.is(':checked');
            });
        }
        // Textbox Question.
        if(self.hasClass('textbox')) {
            var textbox = self.find('input[type="text"]');
            data[textbox.attr("unique_id")] = textbox.val();
        }
        // Multiple selection Questions.
        if(self.hasClass('checklist')) {
            self.find('input[type="checkbox"]').each(function() {
                var s = $(this);
                data[s.attr("unique_id")] = this.checked;
                console.info("checkbox "+s.attr("unique_id") + " "+data[s.attr("unique__id")])
            });
        }
    })

    if(JSON.stringify(data) !== localStorage[section]){
        localStorage[section] = JSON.stringify(data);
        localStorage[get_section()+"_checked"] = "false";
    }
}

/**
 * When called this function assign each to each field his snapshot value in the localstorage
 */
function restore_data(){
    let section = get_section();
    var questions = $('li.question-row');
    var total_questions = questions.length;

    let data = JSON.parse(localStorage.getItem(section))

    questions.each(function(i, el) {
        var self = $(this);
        // Single Question.
        if (self.hasClass('radio-list')) {
            self.find('input[type="radio"]').each(function() {
                var s = $(this);
                s.prop("checked", (Boolean) (data[s.attr("unique_id")]))
            });
        }
        // Textbox Question.
        if(self.hasClass('textbox')) {
            var textbox = self.find('input[type="text"]');
            textbox.val(data[textbox.attr("unique_id")]);
        }
        // Multiple selection Questions.
        if(self.hasClass('checklist')) {
            self.find('input[type="checkbox"]').each(element => {
                var s = $(this);
                s.checked = data[s.attr("unique_id")]
            });
        }
    })
}