import Component from '@glimmer/component';
import { inject as service } from '@ember/service';


export default class BridgeFrameComponent extends Component {
  <template>
    {{yield}}
  <div>

    Iframe src is: <pre>http://localhost:8080/app/{{this.initialPath}}</pre>
  <div>
    URL: <pre> {{this.url}} </pre>
  </div>

  </div>
    <iframe src="http://localhost:8080/app/{{this.initialPath}}" width="100%" height="600px"
        frameborder="0" style="position:absolute; top:200px; left: 0"
      />
  </template>

  @service router;
  constructor() {
    super(...arguments);
    this.initialPath = this.args.path;

    window.addEventListener('message', (event) => {
      if (this.args.path !== event.data.path) {
        this.router.transitionTo(this.args.route, {[this.args.routeParam]: event.data.path});
      }
    });
  }

  get url() {
    return window.location;
  }
}
