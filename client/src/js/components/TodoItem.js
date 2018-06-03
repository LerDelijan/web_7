import React, {Component} from 'react';
import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';
import {changeDone} from '../actions/todo_actions';
import {Link} from 'react-router-dom'

class TodoItem extends Component {
    handleChange = () => this.props.changeDone(this.props.todo.id);

    isDone = () => this.props.todo.attributes.done;

    render() {
        return (
            <li className={"list-group-item mb-2 " + (this.isDone() ? 'done-task' : '')}>
                <div className='container'>
                    <div className="row">
                        <div className="col-10">
                            <h4 className={this.isDone() ? 'done-task' : ''}>
                                {this.props.todo.attributes.text}
                            </h4>
                        </div>
                        <div className="col-1">
                            <button className='btn btn-outline-success' onClick={this.handleChange}>Done</button>
                        </div>
                        <div className="col-1">
                            <Link role='button' className='btn btn-secondary' to={`/done/${this.props.todo.id}`}>More</Link>
                        </div>
                    </div>
                </div>
            </li>
        );
    }
}

const mapDispatchToProps = dispatch => bindActionCreators(
    {changeDone},
    dispatch
);

export default connect(null, mapDispatchToProps)(TodoItem);
