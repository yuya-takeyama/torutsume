# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  displayLineCommentForm = (lineNumber) ->
    $('tr.line_comment_form').each (i, elem) ->
      $elem = $(elem)
      if $elem.attr('data-line-comment-form-for') == lineNumber
        $elem.toggleClass('hidden')

  $('.line_number_link').on 'click', (event) ->
    event.preventDefault()
    $self = $(@)
    displayLineCommentForm($self.attr('data-line-number'))
