import React from 'react';

class ItemDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const {name, happiness, price} = this.props.item;
    return (
      <section>
        <ul>
          <li key="item-name">{name}</li>
          <li key="item-happiness">{happiness}</li>
          <li key="item-price">{price}</li>
        </ul>
      </section>
    );
  }
}

export default ItemDetail;
