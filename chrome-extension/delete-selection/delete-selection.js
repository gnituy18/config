document.addEventListener('keydown', (e) => {
  if (e.key === 'd') {
    const selection = window.getSelection();
    if (selection.rangeCount > 0) {
      selection.deleteFromDocument()
    }
  }
});
