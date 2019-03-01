const speech = document.querySelector('.speech-body');

const generateRandomToken = () => {
  return Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
};

const removeTooltips = () => {
  const toolTips = document.querySelectorAll('.highlightMenu');
  toolTips.forEach(toolTip => toolTip.remove());
};

const popOver = () => {
  return (
    `<div class="highlightMenu-inner">
      <div class="highlight-tools">
        <i class="fas fa-highlighter"></i>
        <i class="fas fa-comment"></i>
      </div>
    </div>
    <div class="highlightMenu-arrowClip">
      <span class="highlightMenu-arrow"></span>
    </div>`
  );
};

const createTooltip = (range) => {
  const rectList = range.getClientRects();

  const div = document.createElement('div');
  div.innerHTML = popOver();
  div.classList.add('highlightMenu');
  div.style.position = 'fixed';
  div.style.top = (rectList[0].top - 54) + 'px';
  div.style.left = ((rectList[0].left - 50) + (rectList[0].width / 2)) + 'px';
  document.body.appendChild(div);
};

const bindTooltipEvents = (range, start, end) => {
  const highlight = document.querySelector('.fa-highlighter');
  const comment = document.querySelector('.fa-comment');

  comment.addEventListener('click', () => {
    displayForm();
    highlightSelection(range, start, end);
    }
  );
  highlight.addEventListener('click', () => highlightSelection(range, start, end));
};

const displayForm = () => {
  const form = document.getElementById('new_contribution');
  const textInput = form.querySelector('textarea');
  form.classList.add('is-visible');

  textInput.setSelectionRange(0, 0);
  textInput.focus();
};

const highlightSelection = (range, start, end) => {
  const token = generateRandomToken();
  const span = document.createElement('span');
  span.classList.add('highlightedSelection');
  span.dataset.uui = token;

  if (start.isEqualNode(end)) {
    range.surroundContents(span);
  } else {
    range.setEndAfter(start);
    range.surroundContents(span);
  }
  setHighlightPosition(range, token);
  removeTooltips();
};

const setHighlightPosition = (range, token) => {
  // const speechRange = document.createRange();
  // speechRange.selectNode(speech);
  // console.log(speechRange.startOffset);
  // speechRange.setStart(span, 0);
  // console.log(speechRange.startOffset);
  const paragraphIndex = range.startContainer.dataset.index;
  const paragraphInput = document.getElementById('contribution_paragraph');
  paragraphInput.value = paragraphIndex;

  const uuiInput = document.getElementById('contribution_selection_uui');
  uuiInput.value = token;

  const speechHtmlInput = document.getElementById('speech_html');
  speechHtmlInput.value = speech.innerHTML;
};

const logSelection = (event) => {
  removeTooltips();
  // const selection = window.getSelection();
  // const startPosition = selection.anchorOffset;
  // const endPosition = selection.focusOffset;

  const selection = window.getSelection();
  const start = selection.getRangeAt(0).startContainer.parentNode;
  const end = selection.getRangeAt(0).endContainer.parentNode;
  const range = selection.getRangeAt(0);

  if (range.collapsed) return
  createTooltip(range);
  bindTooltipEvents(range, start, end);
};

const initHighlighter = function() {

  if (speech) {
    speech.addEventListener('mouseup', logSelection);
  }
};

export { initHighlighter };
