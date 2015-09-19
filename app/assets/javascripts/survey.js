$(document).ready(function () {

    function playSurvey() {
        var $survey = $('.survey-container');
        var $cards = $survey.find('.survey-card');

        $cards.on('click', '.question', function(){
            $(this).closest('.survey-card').find('.answer').show();
        });

        $cards.on('click', '.answer button', function(){
            var next_index = $(this).closest('.survey-card').data('card') + 1;
            $(this).closest('.survey-card').hide();
            var $next_card = $('#card-' + next_index);
            if($next_card.length > 0) {
                $next_card.show();
            } else {
                $('#card-end').show();
            }
        });

        $cards.find('.answer').hide();
        $cards.hide();
        $cards.first().show();
    }

    if ($('.survey-container').length > 0) {
        playSurvey();
    }
});
