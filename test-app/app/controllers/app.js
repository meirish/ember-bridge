import Controller from '@ember/controller';

export default class extends Controller {
  get inIframe() {
    return window.self !== window.top;
  }
  get url() {
    return window.location;
  }
}
