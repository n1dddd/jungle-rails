describe('Visits homepage', () => {

    it('test if cypress connects to the homepage', () => {
        cy.visit('http://localhost:3000')
    })
});