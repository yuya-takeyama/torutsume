# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  displayLineCommentForm = (lineNumber) ->
    $('tr.line_comment_form').each (i, elem) ->
      $elem = $(elem)
      if $elem.attr('data-line-comment-form-for') == lineNumber
        $elem.toggleClass('hidden')

  $('.line_number').on 'click', (event) ->
    event.preventDefault()
    $self = $(@)
    displayLineCommentForm($self.attr('data-line-number'))

  $('.line_number').on 'mouseover', (event) ->
    $self = $(@)
    $self.addClass('line_number_hover')

  $('.line_number').on 'mouseleave', (event) ->
    $self = $(@)
    $self.removeClass('line_number_hover')
