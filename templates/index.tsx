import { h, render } from "preact";

function App() {
  return (
    <main data-display="flex" data-direction="column">
      starter
    </main>
  );
}

render(<App />, document.querySelector("#root") as Element);
